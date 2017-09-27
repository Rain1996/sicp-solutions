(define (c+ x y)
    (let ((z (make_connector)))
        (adder x y z)
        z))

(define (c- z x)
    (let ((y (make_connector)))
        (adder x y z)
        y))

(define (c* x y)
    (let ((z (make_connector)))
        (multiplier x y z)
        z))

(define (c/ z x)
    (let ((y (make_connector)))
        (multiplier x y z)
        y))

(define (cv value)
    (let ((z (make_connector)))
        (constant value z)
        z))


; test
(define (celsius_fahrenheit_converter x)
    (c+ (c* (c/ (cv 9) (cv 5))
            x)
        (cv 32)))

(define C (make_connector))
(define F (celsius_fahrenheit_converter c))

(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)

(set_value! C 25 'user)

(forget_value! C 'user)

(set_value! F 212 'user)
