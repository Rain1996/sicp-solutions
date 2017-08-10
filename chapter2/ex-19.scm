(define no_more? null?)
(define except_first_denomination cdr)
(define first_denomination car)

(define (cc amount coin_values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no_more? coin_values)) 0)
          (else
            (+ (cc amount (except_first_denomination coin_values))
               (cc (- amount (first_denomination coin_values)) coin_values)))))


; test
(define us_coins (list 50 25 10 5 1))
; 292
(cc 100 us_coins)
