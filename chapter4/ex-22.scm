; 在analyse函数中加入let表达式的处理，其余的跟4.6一样
(define (eval exp env)
    ((analyze exp) env))

(define (analyze exp)
    (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
          ((quoted? exp) (analyze-quoted exp))
          ((variable? exp) (analyze-variable exp))
          ((assignment? exp) (analyze-assignment exp))
          ((definition? exp) (analyze-definition exp))
          ((if? exp) (analyze-if exp))
          ((lambda? exp) (analyze-lambda exp))
          ((begin? exp) (analyze-sequence (begin-actions exp)))
          ((cond? exp) (analyze (cond->if exp)))
          ((let? exp) (analyze (let->combinaion exp)))      ; let expression
          ((application? exp) (analyze-application exp))
          (else (error "Unknown expression type -- ANALYZE" exp))))

; let expression
(define (let? exp) (tagged-list? exp 'let))
(define (let-parameters exp) (map car (cadr exp)))
(define (let-values exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))

; 因为operands的实现是用cdr,所以这里用cons组合
(define (let->combinaion exp)
    (cons (make-lambda (let-parameters exp)
                       (let-body exp))
          (let-values exp)))
