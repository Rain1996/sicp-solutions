(define (let? exp) (tagged-list? exp 'let))
(define (let-parameters exp) (map car (cadr exp)))
(define (let-values exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))

(define (named-let? exp) (symbol? (cadr exp)))
(define (named-let-var exp) (cadr exp))
(define (named-let-parameters exp) (map car (caddr exp)))
(define (named-let-values exp) (map cadr (caddr exp)))
(define (named-let-body exp) (cdddr exp))
(define (named-let-func exp)
    (list 'define
          (named-let-var exp)
          (make-lambda (named-let-parameters exp)
                       (named-let-body exp))))


; 对于命名let, 先定义var这个过程, 然后再调用它
(define (let->combinaion exp)
    (if (named-let? exp)
        (make-begin (list (named-let-func exp)
                          (cons (named-let-var exp)
                                (named-let-values exp))))
        (cons (make-lambda (let-parameters exp)
                           (let-body exp))
              (let-values exp))))
