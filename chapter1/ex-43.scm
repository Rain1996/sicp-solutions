; f(f(f...(g(x))))
(define (repeated_base f g n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (if (< n 2)
        g
        (repeated_base f (compose f g) (- n 1))))

(define (repeated f n)
    (repeated_base f f n))

; test
((repeated square 2) 5)
