(define (next n)
    (cond ((< n 2) 2)       ; can remove
          ((= n 2) 3)
          (else (+ n 2))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))     ; (+ test-divisor 1) => (next test-divisor)

(define (smallest-divisor n) (find-divisor n 2))