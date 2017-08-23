(define (union_set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else (cond ((> (car set1) (car set2))
                            (cons (car set2)
                                  (union_set set1 (cdr set1))))
                      ((< (car set1) (car set2))
                            (cons (car set1)
                                  (union_set (cdr set1) set2)))
                      (else (cons (car set1)
                                  (union_set (cdr set1) (cdr set2))))))))

; test
(union_set (list 1 2 3) (list 2 8 90))
