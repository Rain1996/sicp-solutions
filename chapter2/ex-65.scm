; from book
(define (entry tree) (car tree))
(define (left_branch tree) (cadr tree))
(define (right_branch tree) (caddr tree))
(define (make_tree entry left right)
    (list entry left right))

(define (tree->list tree)
    (define (copy_to_list tree result_list)
        (if (null? tree)
            result_list
            (copy_to_list (left_branch tree)
                          (cons (entry tree)
                                (copy_to_list (right_branch tree)
                                               result_list)))))
    (copy_to_list tree '()))

(define (list->tree elements)
    (car (partial_tree elements (length elements))))

(define (partial_tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left_size (quotient (- n 1) 2)))
            (let ((left_result (partial_tree elts left_size)))
                (let ((left_tree (car left_result))
                      (non_left_elts (cdr left_result))
                      (right_size (- n (+ left_size 1))))
                    (let ((this_entry (car non_left_elts))
                          (right_result (partial_tree (cdr non_left_elts)
                                                      right_size)))
                        (let ((right_tree (car right_result))
                              (remaining_elts (cdr right_result)))
                            (cons (make_tree this_entry left_tree right_tree)
                                  remaining_elts))))))))

(define (intersection_list_set set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1))
              (x2 (car set2)))
            (cond ((= x1 x2)
                    (cons x1 (intersection_list_set (cdr set1) (cdr set2))))
                  ((< x1 x2)
                    (intersection_list_set (cdr set1) set2))
                  ((> x1 x2)
                    (intersection_list_set set1 (cdr set2)))))))

; from ex-62.scm
(define (union_list_set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else (cond ((> (car set1) (car set2))
                            (cons (car set2)
                                  (union_list_set set1 (cdr set1))))
                      ((< (car set1) (car set2))
                            (cons (car set1)
                                  (union_list_set (cdr set1) set2)))
                      (else (cons (car set1)
                                  (union_list_set (cdr set1) (cdr set2))))))))


; balanced tree -> ordered list -> balanced tree
(define (union_set set1 set2)
    (list->tree (union_list_set (tree->list set1)
                                (tree->list set2))))

(define (intersection_set set1 set2)
    (list->tree (intersection_list_set (tree->list set1)
                                       (tree->list set2))))

; test
(define set1 (list->tree (list 2 5 7 10 11 12 18)))
(define set2 (list->tree (list 1 3 5 6 8 9 10)))

(newline)
(display (union_set set1 set2))
(newline)
(display (intersection_set set1 set2))
