(define (div_series series1 series2)
    (let ((constant_term (stream-car series2)))
        (if (= constant_term 0)
            (error "constant term of series2 cannot be zero")
            (mul_series series1
                        (scale-stream (reciprocal_series series2)
                                      (/ 1 constant_term))))))

(define tane_series (div_series sine_series cosine_series))
