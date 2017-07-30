(define (is_even n) (= (remainder n 2) 0))

(define (is_normal_square_root a n)
    (and (not (= a 1))
         (not (= a (- n 1)))
         (= (remainder (square a) n) 1)))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((is_normal_square_root base m) 0)
          ((is_even exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller_rabin_test n)
    (define (try_it a) (= (expmod a (- n 1) n) 1))
    (try_it (+ 1 (random (- n 1)))))

(define (fast_prime? n times)
    (cond ((= times 0) true)
          ((miller_rabin_test n) (fast_prime? n (- times 1)))
          (else false)))
