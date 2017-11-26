; 未做测试
(define (env-loop env match-proc not-match-proc check error-info)
    (define (scan vars vals)
        (cond ((null? vars) (not-match-proc env))
              ((eq? var (car vars)) (match-proc vals val))
              (else (scan (cdr vars) (cdr vals)))))

    (if (and check (eq? env the-empty-environment))
        (error error-info var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))

(define (lookup-variable-value var env)
    (define val false)
    (define check true)
    (define error-info "Unbound variable")
    (define (match-proc vals val) (car vals))
    (define (not-match-proc env) (env-loop (enclosing-environment env)
                                           match-proc
                                           not-match-proc
                                           check
                                           error-info))
    (env-loop env match-proc not-match-proc check error-info))

(define (set-variable-value! var val env)
    (define check true)
    (define error-info "Unbound variable")
    (define (match-proc vals val) (set-car! vals val))
    (define (not-match-proc env) (env-loop (enclosing-environment env)
                                           match-proc
                                           not-match-proc
                                           check
                                           error-info))
    (env-loop env match-proc not-match-proc check error-info))

(define (define-variable! var val env)
    (define check false)
    (define error-info "")
    (define (match-proc vals val) (set-car! vals val))
    (define (not-match-proc env) (add-binding-to-frame! var val (first-frame env))
    (env-loop env match-proc not-match-proc check error-info))
