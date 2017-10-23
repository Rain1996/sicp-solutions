
(define (integral integrand initial_value dt)
    (define int
        (cons-stream initial_value
                     (add-streams (scale-stream integrand dt) int)))
    int)

(define (RC R C dt)
    (lambda (i_stream v0)
        (add-streams (scale-stream i_stream R)
                     (integral (scale-stream i_stream (/ 1 C)) v0 dt))))
