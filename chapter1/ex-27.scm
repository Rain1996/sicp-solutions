(define (even? n) (= (remainder n 2) 0))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat_check a n)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (fermat_check (+ a 1) n))
          (else false)))

(define (carmichael_check n) (fermat_check 2 n))