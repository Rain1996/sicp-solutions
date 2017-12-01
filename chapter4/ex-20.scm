;a)
(define (letrec? exp) (tagged-list? exp 'letrec))
(define (letrec-bindings exp) (cadr exp))
(define (letrec-body exp) (cddr exp))

(define (add-unassigned bindings)
    (map (lambda (binding) (list (car binding) '*unassigned*)) bindings))

(define (add-assigned bindings)
    (map (lambda (binding) (cons 'set! binding)) bindings))

(define (letrec->nested-lets exp)
    (make-lets (letrec-bindings exp) (letrec-body exp)))

(define (make-lets bindings body)
    (list 'let (add-unassigned bindings) (make-begin (append (add-assigned bindings) body))))
