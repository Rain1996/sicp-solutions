(define zero (lambda (f) (lambda (x) x)))
(define (add_1 n)
    (lambda (f) (lambda (x) (f (n f x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (my_add a b)
    (define add_a (lambda (n) (lambda (f) (lambda (x) ((a f) (n f x))))))
    (add_a b))
