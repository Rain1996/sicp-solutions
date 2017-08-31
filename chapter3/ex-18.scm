; 为了能够完成 3.19, 所以 3.18 只能用
; 3.17的办法来判断是否有环了

(define (is_cycle x)
    (let ((help_list '()))
        (define (helper x)
            (cond ((not (pair? x)) False)
                  ((memq x help_list) True)
                  (else (set! help_list (cons x help_list))
                        (or (helper (car x))
                            (helper (cdr x))))))
        (helper x)))

; test
(define pairs1 '(a b c))
(newline)
(display (is_cycle pairs1))

; test
(define pairs4 '(a b c)) 
(set-cdr! (cddr pairs4) pairs4)
(newline)
(display (is_cycle pairs4))