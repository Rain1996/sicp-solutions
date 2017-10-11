(define (display_line x)
    (newline)
    (display x))

(define (show x)
    (display_line x)
    x)

(define (stream_enumerate_interval low high)
    (if (> low high)
        the_empty_stream
        (cons-stream low
                     (stream_enumerate_interval (+ low 1) high))))


; 0
; Value: x
(define x (stream-map show (stream_enumerate_interval 0 10)))

; 1
; 2
; 3
; 4
; 5
; Value: 5
(stream-ref x 5)

; 6
; 7
; Value: 7
(stream-ref x 7)
