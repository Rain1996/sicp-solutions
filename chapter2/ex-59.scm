(define (element_of_set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else (element_of_set? x (cdr set)))))

(define (adjoin_set x set)
    (if (element_of_set? x set)
        set
        (cons x set)))

(define (intersection_set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element_of_set? (car set1) set2)
                (cons (car set1)
                      (intersection_set (cdr set1) set2)))
          (else (intersection_set (cdr set1) set2))))

(define (union_set set1 set2)
    (cond ((null? set1) set2)
          ((element_of_set? (car set1) set2)
                (union_set (cdr set1) set2))
          (else (union_set (cdr set1) (cons (car set1) set2)))))


; test
(define set1 (list 1 2 5 8 6))
(define set2 (list 2 5 3 4 8))

(newline)
(display (adjoin_set 2 set1))

(newline)
(display (adjoin_set 3 set1))

(newline)
(display (intersection_set set1 set2))

(newline)
(display (union_set set1 set2))
