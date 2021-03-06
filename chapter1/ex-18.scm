; double, halve 在mit-scheme中已有定义
(define (is_even n) (= (remainder n 2) 0))

(define (fast_product a b)
    (define (fast_product_iter x y accumulator)
        (cond ((= y 0) accumulator)
              ((is_even y) (fast_product_iter (double x) (halve y) accumulator))
              (else (fast_product_iter x (- y 1) (+ accumulator x)))))
    (fast_product_iter a b 0))
