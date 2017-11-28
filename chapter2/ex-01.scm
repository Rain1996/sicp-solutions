(define (make_rat n d)
    (let ((g (gcd n d)))
        (cons (* (if (> (/ n d) 0) 1 -1) (/ (abs n) g))
              (/ (abs d) g))))
(define (number x) (car x))
(define (denom x) (cdr x))

(define (print_rat x)
    (newline)
    (display (number x))
    (display "/")
    (display (denom x)))

; test
(define minus_one_half (make_rat 1 -2))
(define minus_one_third (make_rat -1 3))
(define one_half (make_rat 1 2))
(define one_third (make_rat -1 -3))

(print_rat minus_one_half)
(print_rat minus_one_third)
(print_rat one_half)
(print_rat one_third)

; 被我搞复杂了，参考http://community.schemewiki.org/?sicp-ex-2.1