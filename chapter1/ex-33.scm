; Iterative implementation
(define (filtered_accumulate combiner null_value term a next b filter_fun)
    (define (iter a result)
        (cond ((> a b) result)
              ((filter_fun a) (iter (next a) (combiner result (term a))))
              (else (iter (next a) result))))
    (iter a null_value))

(define (prime? n)
    (define (divides? a b)
        (= (remainder b a) 0))

    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
             (else (find-divisor n (+ test-divisor 1)))))

    (define (smallest-divisor n) (find-divisor n 2))

    (= n (smallest-divisor n)))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (sum_prime a b)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (filtered_accumulate + 0 identity a inc b prime?))

(define (product n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (define (filter_fun i) (= 1 (gcd n i)))
    (filtered_accumulate * 1 identity 1 inc n filter_fun))