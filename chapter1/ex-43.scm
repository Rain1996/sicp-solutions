(define (double f)
    (lambda (x) (f (f x))))

(define (repeated f n)
    (if (< n 2)
        f
        (repeated (double f ) (- n 1))))

; test
((repeated square 2) 5)