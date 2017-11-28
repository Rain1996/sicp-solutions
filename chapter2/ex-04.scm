(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

(define (print_cons z)
    (newline)
    (display "car z: ")
    (display (car z))
    (newline)
    (display "cdr z: ")
    (display (cdr z)))

; test
(define z (cons 1 2))
(print_cons z)
