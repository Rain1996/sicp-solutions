(define (intergal delay_intergrand initial_value dt)
    (cons-stream initial_value
                 (let ((integrand (force delay_intergrand)))
                    (if (stream-null? integrand)
                        the-empty-stream
                        (intergal (delay (stream-cdr integrand))        ; 这里要加delay
                                  (+ (* dt (stream-car integrand))
                                     initial_value)
                                  dt)))))
