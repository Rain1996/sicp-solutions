; a)
(define (lookup-variable-value var env)
    (define (env-loop env)
        (define (scan vars vals)
            (cond ((null? vars) (env-loop (enclosing-environment env)))
                  ((eq? var (car vars)) (if (eq? (car vals) '*unassigned*)
                                            (error "variable is unassigned" var)
                                            (car vals))
                  (else (scan (cdr vars) (cdr vals)))))
        (if (eq? env the-empty-environment)
            (error "Unbound variable" var)
            (let ((frame (first-frame env)))
                (scan (frame-variables frame)
                      (frame-values frame)))))
    (env-loop env))

; b)
; let 表达式 (let ((<var1> <exp1>) ... (<varn> <expn>)) <body>)
(define (scan-out-defines procedure-body)
    (define (scan-out body defines not_defines)
        (if (null? body)
            (list ('let (reverse defines) (reverse not_defines))) ; 转为 let 表达式
            (let ((first (car body))
                  (rest (cdr body)))
                (if (definition? first)
                    (set! defines (cons (cons (definition-variable first)
                                              (definition-value first))
                                        defines))       ; 如果是定义式，则修改defines
                    (set! not_defines (cons first not_defines)))    ; 非定义式，修改not_defines
                (scan-out rest defines not_defines)))))

; c)
; 安装在 make-procedure 比较好。
; 如果安装在 procedure-body 里面, 那么每次调用都会触发scan-out-defines
