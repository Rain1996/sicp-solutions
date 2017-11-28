; (while <condition> <body>)
; return ok when the expression end
(define (while? exp) (tagged-list? exp 'while))
(define (while-condition exp) (cadr exp))
(define (while-body exp) (caddr exp))

(define (while->if condition body)
    (make-if condition
             (sequence->exp (list body (while->if condition body)))
             'ok))
