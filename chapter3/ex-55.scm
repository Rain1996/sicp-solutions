(define (partial_sums stream)
    (define partial
        (cons-stream (stream-car stream)
                     (add-streams (stream-cdr stream) partial)))
    partial)
