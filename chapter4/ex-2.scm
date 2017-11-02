; a)
; 在用pair?对类似(define x 3)这样的赋值语句求值会得到true,
; 于是会打赋值语句当作过程应用从而出错

; b)
(define (application? exp) (tagged-list? exp 'call)) 
(define (operator exp) (cadr exp)) 
(define (operands exp) (cddr exp)) 
