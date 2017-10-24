(define (smooth s)
    (stream-map (lambda (x y) (/ (+ x y) 2)) s (cons-stream 0 s)))

(define (make_smooth_zero_crossings smooth_fun sense_data)
    (let ((smooth_sense_data (smooth_fun sense_data)))
        (stream-map sign-change-detector smooth_sense_data (cons-stream 0 smooth_sense_data))))

(define smooth_zero_crossings
    (make_smooth_zero_crossings smooth sense_data))
