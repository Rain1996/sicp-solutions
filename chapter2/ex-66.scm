(define (entry tree) (car tree))
(define (left_branch tree) (cadr tree))
(define (right_branch tree) (caddr tree))

(define (lookup given_key set_of_records)
    (if (null? set_of_records)
        False
        (let ((curr (entry set_of_records)))
            (let ((curr_key (key set_of_records)))
                (cond ((= given_key curr_key) curr)
                      ((> given_key curr_key)
                            (lookup given_key (right_branch tree)))
                      ((else (lookup given_key (left_branch tree)))))))))
