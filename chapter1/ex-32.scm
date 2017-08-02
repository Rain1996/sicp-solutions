; Recursive implementation
(define (accumulate combiner null_value term a next b)
    (if (> a b)
        null_value
        (combiner (term a)
                  (accumulate combiner null_value term (next a) next b))))

; Iterative implementation
(define (accumulate_iter combiner null_value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null_value))


(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (product term a next b)
    (accumulate_iter * 1 term a next b))
