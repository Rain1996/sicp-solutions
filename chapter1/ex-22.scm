(define (next-odd n)
    (define (even? n) (= (remainder n 2) 0))
    (if (even? n) (+ n 1) (+ n 2)))


(define (prime? n)
    (define (divides? a b)
        (= (remainder b a) 0))

    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
             (else (find-divisor n (+ test-divisor 1)))))

    (define (smallest-divisor n) (find-divisor n 2))

    (= n (smallest-divisor n)))


(define (timed-prime-test n)
    (define (report-prime elapsed-time n)
        (newline)
        (display n)
        (display " *** ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (cond ((prime? n) (report-prime (- (runtime) start-time) n) true)
              (else false)))

    (start-prime-test n (runtime)))

; 找出大于或等于 num 的 n 个素数
(define (find_n_prime num n)
    (cond ((= n 0) (newline))
          ((timed-prime-test num) (find_n_prime (next-odd num) (- n 1)))
          (else (find_n_prime (next-odd num) n))))


; > (find_n_prime 100000000 3)
; 100000007 *** 3.099999999999806e-2
; 100000037 *** 3.100000000000583e-2
; 100000039 *** 0.04700000000006

; > (find_n_prime 1000000000 3)
; 1000000007 *** 0.09399999999999942
; 1000000009 *** 0.09399999999999942
; 1000000021 *** 0.09299999999999997

; > (find_n_prime 10000000000 3)
; 10000000019 *** 0.3289999999999885
; 10000000033 *** 0.328000000000012
; 10000000061 *** 0.3599999999999766

; > (find_n_prime 100000000000 3)
; 100000000003 *** 1.0619999999999976
; 100000000019 *** 1.1089999999999982
; 100000000057 *** 1.0939999999999976