(define (make_accumulator num)
    (lambda (n)
        (set! num (+ num n))
        num))

; test
(define A (make_accumulator 5))
(newline)
(display (A 10))
(newline)
(display (A 10))
