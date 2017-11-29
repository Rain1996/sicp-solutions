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
    (define (add-defines exp defines)
        (cons (cons (definition-variable exp) '*unassigned*) defines))
    (define (add-not-defines exp not-defines)
        (cons exp not-defines))
    (define (add-sets exp sets)
        (cons (list 'set! (definition-variable exp) (definition-value exp)) sets))
    (define (to-let defines not-defines sets)
        (cons 'let (cons defines (append sets not-defines))))
    (define (scan-out body defines not-defines sets)
        (if (null? body)
            (to-let (reverse defines)
                    (resversr not-defines)
                    (revers sets))                              ; 转为 let 表达式
            (let ((first (car body))
                  (rest (cdr body)))
                (if (definition? first)
                    (scan-out rest (add-defines first defines)
                                   not-defines
                                   (add-sets first sets))       ; 如果是定义式，则修改defines 和 sets
                    (scan-out rest
                              defines
                              (add-not-defines first not-defines)
                              sets)))))                         ; 非定义式，修改not-defines
    (scan-out procedure-body '() '() '()))

; c)
; 安装在 make-procedure 比较好。
; 如果安装在 procedure-body 里面, 那么每次调用都会触发scan-out-defines
