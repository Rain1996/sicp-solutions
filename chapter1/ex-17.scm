(define (double n) (+ n n))
(define (halve n) (/ n 2))
(define (is_even n) (= (remainder n 2) 0))

(define (fast_product a b)
    (cond ((= b 0) 0)
          ((is_even b) (double (fast_product a (halve b))))
          (else (+ a (fast_product a (- b 1))))))
