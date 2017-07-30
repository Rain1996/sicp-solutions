; 我的解法有点跑偏 =_=
(define (is_even n) (= (remainder n 2) 0))

(define (fast_expt_iter counter product)
    (cond ((= counter 1) product)
          ((is_even counter) (fast_expt_iter (/ counter 2) (square product)))
          (else (* product (fast_expt_iter (- counter 1) product)))))

(define (fast_expt b n)
    (if (= n 0) 1 (fast_expt_iter n b)))

; 不跑偏的解法：http://community.schemewiki.org/?sicp-ex-1.16