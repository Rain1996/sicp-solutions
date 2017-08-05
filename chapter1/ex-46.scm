(define (iterative_improve close_enough? improve_method)
    (define (try guess)
        (let ((next (improve_method guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    try)

(define (fixed_point f first_guess)
    (define tolerance 0.00001)
    (define (close_enough? v1 v2)
            (< (abs (- v1 v2)) tolerance))
    ((iterative_improve close_enough? f) first_guess))

; test
(fixed_point (lambda(x) (/ (+ x (/ (log 1000) (log x))) 2)) 2)
