; double, halve 在mit-scheme中已有定义
(define (is_even n) (= (remainder n 2) 0))

(define (fast_product a b)
    (cond ((= b 0) 0)
          ((is_even b) (double (fast_product a (halve b))))
          (else (+ a (fast_product a (- b 1))))))
