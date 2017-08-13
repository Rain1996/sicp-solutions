; from ex-2.33
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

; from ex-1.22
(define (prime? n)
    (define (divides? a b)
        (= (remainder b a) 0))

    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
             (else (find-divisor n (+ test-divisor 1)))))

    (define (smallest-divisor n) (find-divisor n 2))

    (= n (smallest-divisor n)))

(define (enumerate_interval low high)
    (if (> low high)
        '()
        (cons low (enumerate_interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (prime_sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make_pair_sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (unique_pairs n)
    (flatmap (lambda (i)
                (map (lambda (j) (list i j))
                     (enumerate_interval 1 (- i 1))))
             (enumerate_interval 1 n)))

(define (prime_sum_pairs n)
    (map make_pair_sum
         (filter prime_sum? (unique_pairs n))))

; test
(newline)
(display (unique_pairs 6))
(newline)
(display (prime_sum_pairs 6))
