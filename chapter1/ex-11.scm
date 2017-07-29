; Recursive implementation
(define (fun_rec n)
    (cond ((< n 3) n)
          (else (+ (fun (- n 1))
                   (* 2 (fun (- n 2)))
                   (* 3 (fun (- n 3)))))))

; Iterative implementation
(define (fun n)
    (define (f x y z) (+ (* 3 x) (* 2 y) z))
    (define (fun_iter x y z num)
            (cond ((= num 0) x)
                  (else (fun_iter y z (f x y z) (- num 1)))))
    (cond ((< n 3) n)
          (else (fun_iter 0 1 2 n))))
