(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
    (eq? (cond-predicate clause) 'else))

; another cond clause: =>
(define (cond-another-clause? clause)
    (eq? (cadr clause) '=>))
(define (cond-test clause) (car clause))
(define (cond-recipient clause) (caddr clause))

(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp)
    (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (if (cond-another-clause? first)    ; another cond clause: =>
                (make-if (cond-test first)
                         (list (cond-recipient first) (cond-test first))
                         (expand-clauses rest))
                (make-if (cond-predicate first)
                         (sequence->exp (cond-actions first))
                         (expand-clauses rest)))))))
