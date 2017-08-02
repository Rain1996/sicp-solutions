; Recursive implementation
(define (product_rec term a next b)
    (if (> a b)
        1 
        (* (term a) (product term (next a) next b))))

;Iterative implementation
(define (product term a next b)
    (define (iter term a next result)
        (if (> a b)
            result
            (iter term (next a) next (* (term a) result))))
    (iter term a next 1))


(define (factorial n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (product identity 1 inc n))

; n > 2
(define (john_wallis n)
    (define (next_two n) (+ n 2))
    (define (fun1 n) (/ n (+ n 1)))
    (define (fun2 n) (/ n (- n 1)))
    (* (product fun1 2 next_two n)
       (product fun2 4 next_two n)))