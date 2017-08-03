(define (cont_frac n d k)
    (define (iter i result)
        (if (< i 1)
            result
            (iter (- i 1) 
                  (/ (n i) (+ (d i) result)))))
    (iter k 0))

(define (D i)
    (if (= (remainder (+ i 1) 3) 0) 
        (* (/ (+ i 1) 3) 2)
        1))

; test
(cont_frac (lambda (i) 1.0) D 100)
