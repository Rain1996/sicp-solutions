; f(f(f...(g(x))))
(define (repeated_base f g n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (if (< n 2)
        g
        (repeated_base f (compose f g) (- n 1))))


(define (smooth f)
    (define dx 0.00001)
    (lambda (x) (/ (+ (f x) 
                      (f (+ x dx))
                      (f (- x dx))) 3)))


(define (repeated_smooth f n)
    (repeated_base smooth f n))
