(define (add_streams s1 s2)
    (stream-map + s1 s2))

(define (partial_sums stream)
    (define partial
        (cons-stream (stream-car stream)
                     (add_streams (stream-cdr stream) partial)))
    partial)
