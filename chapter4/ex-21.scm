; a) 效率有点低
((lambda (n)
    ((lambda (fib)
        (fib fib n))
     (lambda (fb k)
        (if (or (= k 1) (= k 2))
            1
            (+ (fb fb (- k 1)) (fb fb (- k 2)))))))
6)

; b)
ev? od? (- n 1)
ev? od? (- n 1)

;; a有个效率高的解法
;; http://community.schemewiki.org/?sicp-ex-4.21
