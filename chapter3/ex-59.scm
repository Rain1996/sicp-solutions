; a)
(define (div-streams s1 s2)
    (stream-map / s1 s2))

(define (integrate_series stream)
    (div-stream stream integers))

; b)
(define cosine_series
    (cons-stream 1 (integrate_series (scale_stream sine_series -1))))

(define sine_series
    (cons-stream 0 (integrate_series cosine_series)))
