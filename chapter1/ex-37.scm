; Recursive implementation
(define (cont_frac n d k)
    (define (cont_frac_rec i)
        (if (> i k)
            0
            (/ (n i)
               (+ (d i) (cont_frac_rec (+ i 1))))))
    (cont_frac_rec 1))

; Iterative implementation
(define (cont_frac_iter n d k)
    (define (iter i result)
        (if (< i 1)
            result
            (iter (- i 1) 
                  (/ (n i) (+ (d i) result)))))
    (iter k 0))
