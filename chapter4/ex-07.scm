(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-bindings exp) (cadr exp))
(define (let*-body exp) (cddr exp))

(define (let*->nested-lets exp)
    (make-lets (let*-bindings exp) (let*-body exp)))

(define (make-lets bindings body)
    (if (null? bindings)
        body
        (let ((first (car bindings))
              (rest (cdr bindings)))
            (list 'let
                  (list first)
                  (make-lets rest body)))))
