(define (display_line x)
    (newline)
    (display x))

(define (display_stream s)
    (stream-for-each display_line s))

(define (ln2_stream_helper n)
       (cons-stream (/ 1.0 n) (stream-map - (ln2_stream_helper (+ n 1)))))

(define ln2_stream
    (partial_sums (ln2_stream_helper 1)))

