(define (last_pair a_list)
    (cond ((null? a_list) (error "A empty list!"))
          ((null? (cdr a_list)) (car a_list))
          (else (last_pair (cdr a_list)))))

; test
(last_pair (list 1 2 3))
