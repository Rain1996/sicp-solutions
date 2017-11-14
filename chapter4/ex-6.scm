(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((quoted? exp) (text-of-quotation exp))
          ((assignment? exp) (eval-assignment exp env))
          ((definition? exp) (eval-definition exp env))
          ((let? exp) (eval (let->combinaion) env))      ; let expression
          ((if? exp) (eval-if exp env))
          ((lambda? exp)
                (make-procedure (lambda-parameters exp)
                                (lambda-body exp)
                                env))
          ((begin? exp)
                (eval-sequence (begin-actions exp) env))
          ((cond? exp) (eval (cond->if exp) env))
          ((application? exp)
                (apply (eval (operator exp) env)
                       (list-of-values (operands exp) env)))
          (else (error "Unknown expression type -- EVAL" exp))))

; let expression
(define (let? exp) (tagged-list? exp 'let))
(define (let-variables exp) (map car (cadr exp)))
(define (let-value exp) (map cdr (cadr exp)))
(define (let-body exp) (cddr exp))

(define (let->combinaion exp)
    (cons (make-lambda (let-variables exp)
                       (let-body exp))
          (let-value exp)))
