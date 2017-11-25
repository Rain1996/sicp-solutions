; 这个过程也可以用map
; (define (make-frame variables values)
;       (map cons variables values))
; 选择不用map的理由是可以使用不支持高阶过程的语言来写求值器
(define (make-frame variables values)
    (if (null? variables)
        '()
        (cons (cons (car variables) (cdr values))
              (make-frame (cdr variables) (cdr values)))))

(define (add-binding-to-frame! var val frame)
    (cons (cons var val) frame))

; extend-environment 不变

(define (lookup-variable-value var env)
    (define (env-loop env)
        (define (scan bindings)
            (cond ((null? bindings) (env-loop (enclosing-environment env)))
                  ((eq? var (caar bindings)) (cdar bindings))
                  (else (scan (cdr bindings)))))
        (if (eq? env the-empty-environment)
            (error "Unbound variable" var)
            (scan (first-frame env))))
    (env-loop env))

(define (set-variable-value! var val env)
    (define (env-loop env)
        (define (scan bindings)
            (cond ((null? bindings) (env-loop (enclosing-environment env)))
                  ((eq? var (caar bindings)) (set-cdr! (car bindings) val))
                  (else (scan (cdr bindings)))))
        (if (eq? env the-empty-environment)
            (error "Unbound variable -- SET!" var)
            (scan (first-frame env))))
    (env-loop env))

(define (define-variable! var val env)
    (define (scan bindings)
        (cond ((null? bindings) (add-binding-to-frame! var val frame))
              ((eq? var (caar bindings)) (set-cdr! (car bindings) val))
              (else (scan (cdr bindings)))))
      (scan (first-frame env)))
