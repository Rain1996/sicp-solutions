; from book
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                        (let ((t1->t2 (get-coercion type1 type2))
                              (t2->t1 (get-coercion type2 type1)))
                            (cond (t1->t2
                                    (apply-generic op (t1->t2 a1) a2))
                                  (t2->t1
                                    (apply-generic op a1 (t2->t1 a2)))
                                  (else
                                    (error "No method for these types"
                                            (list op type-tags))))))
                    (error "No method for these types"
                            (list op type-tags)))))))


; a) 解释器会出现假死(无限递归)。
; b) Louis 并没有纠正同类型参数的强制问题，Louis
;    的强制过程会在同类型参数转化时 generic 一
;    直重复调用自身（第15行的代码），导致解释器假死。

; c) 加个判断(第41 - 42 行)
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                        (if (equal? type1 type2)
                            (error "No method for this type" (list op type1))
                            (let ((t1->t2 (get-coercion type1 type2))
                                  (t2->t1 (get-coercion type2 type1)))
                                (cond (t1->t2
                                        (apply-generic op (t1->t2 a1) a2))
                                    (t2->t1
                                        (apply-generic op a1 (t2->t1 a2)))
                                    (else
                                        (error "No method for these types"
                                                (list op type-tags)))))))
                    (error "No method for these types"
                            (list op type-tags)))))))
