(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((quoted? exp) (text-of-quotation exp))
          ((assignment? exp) (eval-assignment exp env))
          ((definition? exp) (eval-definition exp env))
          ((if? exp) (eval-if exp env))
          ((lambda? exp)
                (make-procedure (lambda-parameters exp)
                                (lambda-body exp)
                                env))
          ((begin? exp)
                (eval-sequence (begin-actions exp) env))
          ((cond? exp) (eval (cond->if exp) env))
          ((and? exp) (eval-and exp env))       ; special forms and
          ((or? exp) (eval-or exp env))         ; special forms or
          ((application? exp)
                (apply (eval (operator exp) env)
                       (list-of-values (operands exp) env)))
          (else (error "Unknown expression type -- EVAL" exp))))

; special forms and
(define (and? exp) (tagged-list? exp 'and))
(define (and-clauses exp) (cdr exp))
(define (and-first-clause clauses) (car clauses))
(define (and-rest-clause clauses) (cdr clauses))

(define (eval-and exp env)
    (eval-and-helper (and-clauses exp) env))

(define (eval-and-helper clauses env)
    (let ((first (and-first-clause clauses))
          (rest (and-rest-clause clauses)))
        (if (null? clauses)
            'true
            (if (true? (eval first env))
                (eval-and-helper rest env)
                'false))))

; special forms or
(define (or? exp) (tagged-list? exp 'or))
(define (or-clauses exp) (cdr exp))
(define (or-first-clause clauses) (car clauses))
(define (or-rest-clause clauses) (cdr clauses))

(define (eval-or exp env)
    (eval-or-helper (or-clauses exp) env))

(define (eval-or-helper clauses env)
    (let ((first (or-first-clause clauses))
          (rest (or-rest-clause clauses)))
        (if (null? clauses)
            'false
            (if (true? (eval first env))
                'true
                (eval-or-helper rest env)))))
