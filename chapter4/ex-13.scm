; 只删除环境中第一个框架的约束
; remove only the binding in the first frame of the environment
(define (make-unbound! var val env)
    (let ((frame (first-frame env)))
        (define (scan pre-vars pre-vals vars vals)
            (cond ((and (not (null? vals)) (eq? var (car vars)))
                    (set-cdr! pre-vars (cdr vars))
                    (set-cdr! pre-vals (cdr vals)))
                  (else (scan vars vals (cdr vars) (cdr vals)))))
        (scan (frame-variables frame)
              (frame-values frame))))
