; 比如想把(define <var> <value>) 改成 (<var> := <value>)
; 只需要改变 definition?, definition-variable过程。
; 改为 (define (definition? exp) (cadr exp ':=))
; (define (definition-variable exp) (car exp))
; 而 eval 和 apply 无需改变
