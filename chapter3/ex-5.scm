(define (random_in_range low high)
    (let ((range (- high low)))
        (+ low (random range))))

(define (monte_carlo trials experiment)
    (define (iter trials_ramining trials_passed)
        (cond ((= trials_ramining 0)
                (/ trials_passed trials))
              ((experiment)
                (iter (- trials_ramining 1) (+ trials_passed 1)))
              (else
                (iter (- trials_ramining 1) trials_passed))))
    (iter trials 0))

(define (estimate_integral p x1 x2 y1 y2 times)
        (/ ( * (monte_carlo times (p x1 x2 y1 y2))
             (* (- x2 x1) (- y2 y1))) 9))


(define (in_circle x1 x2 y1 y2)
    (define (p)
        (let ((x (random_in_range x1 x2))
              (y (random_in_range y1 y2)))
            (<= (+ (* x x) (* y y)) 9)))
    p)


; test
(estimate_integral in_circle -10 10 -10 10 100000.0)
