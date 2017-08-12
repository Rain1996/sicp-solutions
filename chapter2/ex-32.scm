(define (subsets s)
    (if (null? s)
        (list '())
        (let ((rest (subsets (cdr s))))
            (append rest
                    (map (lambda (rest_subsets)
                                 (cons (car s) rest_subsets))
                                 rest)))))

; test
(define s (list 1 2 3))
(subsets s)

; 参考零钱兑换程序
