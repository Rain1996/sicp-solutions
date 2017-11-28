(define (my_cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (iter z base result)
    (if (= (remainder z base) 0)
        (iter (/ z base) base (+ result 1))
        result))

(define (my_car z)
    (iter z 2 0))

(define (my_cdr z)
    (iter z 3 0))

; test
(define (print_cons a b)
    (define z (my_cons a b))
    (newline)
    (display "cons: ")
    (display z)
    (display " car: ")
    (display (my_car z))
    (display " cdr: ")
    (display (my_cdr z)))

(print_cons 3 5)
