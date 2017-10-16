(define (reciprocal_series series)
    (define reciprocal_series_temp
        (cons-stream 1
                     (scale-stream (mul_series (stream-cdr series)
                                               reciprocal_series_temp)
                                   -1)))
    reciprocal_series_temp)
