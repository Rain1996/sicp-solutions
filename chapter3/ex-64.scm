; 使用 stream-ref 会简短些
(define (stream_limit stream tolerance)
    (let ((prev (stream-car stream))
          (next (stream-car (stream-cdr stream))))
        (if (< (abs (- prev next)) tolerance)
            next
            (stream_limit (stream-cdr stream) tolerance))))
