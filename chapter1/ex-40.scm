(define dx 0.00001)
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

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
           dx)))

(define (newtons_transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons_method g guess)
    (fixed_point (newtons_transform g) guess))


(define (cubic a b c)
    (define (cube x) (* x x x))
    (lambda (x)
        (+ (cube x)
            (* a (square x))
            (* b x)
            c)))

; test
(newtons_method (cubic -1 1 -1) 2)
