(define sum 0)

(define (accum x)
    (set! sum (+ x sum))
    sum)

; sum - 1
(define seq (stream-map accum (stream_enumerate_interval 1 20)))

; sum - 6
(define y (stream-filter even? seq))

; sum - 10
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))

; sum - 136
(stream_ref y 7)

; sum - 210
(display_stream z)

; 不使用记忆过程的话, 会产生重复计算导致accum的多次调用, 从而会产生不一样的sum值
