(define (tan_cf x k)
    (define (cont_frac n d k)
        (define (iter i result)
            (if (< i 1)
                result
                (iter (- i 1) 
                      (/ (n i) (+ (d i) result)))))
        (iter k 0))

    (define (D i) (- (* 2 i) 1))

    (define (N i)
        (if (= i 1) x (- (square x))))

    (cont_frac N D k))