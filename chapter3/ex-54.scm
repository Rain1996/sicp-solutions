(define (mul-streams s1 s2)
    (stream-map * s1 s2))

; 0! = 1
(define factorials (cons-stream 1 (mul-streams integers factorials)))
