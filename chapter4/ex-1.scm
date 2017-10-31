; left to right
(define (list-of-values exps env)
    (if (not-operands? exps)
        '()
        (let ((first (eval (first-operand exps) env)))
            (cons first
                  (list-of-values (rest-operands exps) env)))))


; rigth to left
(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let ((rest (list-of-values (rest-operands exps) env)))
            (cons (eval (first-operand exps) env) rest))))
