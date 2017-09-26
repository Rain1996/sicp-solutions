(define (average_convert a b c)
    (let ((sum (make_connector))
          (count (make_connector)))
        (adder a b sum)
        (multiplier c count sum)
        (constant 2 count)
        'ok))

; test
(define A (make_connector))
(define B (make_connector))
(define C (make_connector))

(average_convert A B C)

(probe "A" A)
(probe "B" B)
(probe "C" C)

(set_value! A 25 'user)
(set_value! B 15 'user)

(forget_value! A 'user)

(set_value! C 50 'user)
(set_value! A 40 'user)
