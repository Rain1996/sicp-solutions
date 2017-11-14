(define (make_zero_crossings input_stream last_value last_avpt)
    (let ((avpt (/ (+ (stream-car input_stream) last_value) 2)))
        (cons-stream (sign_change_detector avpt last_avpt)
                     (make_zero_crossings (stream-cdr input_stream)
                                          (stream-car input_stream)
                                          avpt))))