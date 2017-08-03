(define tolerance 0.00001)

(define (fixed_point f first_guess)
    (define (close_enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))


(define (f x) (+ 1 (/ 1 x)))

(fixed_point f 1.0)