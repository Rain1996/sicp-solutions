(define (g s)
    (lambda (n)
        (if (= n 0)
            (begin (set! s 0) s)
            s)))

(define f (g 1))

; test
(newline)
(display (+ (f 0) (f 1)))
(newline)
(display (+ (f 1) (f 0)))
