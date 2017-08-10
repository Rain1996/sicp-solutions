(define (reverse a_list)
    (define (reverse_iter a_list result)
        (if (null? a_list)
            result
            (reverse_iter (cdr a_list) (cons (car a_list) result))))
    (reverse_iter a_list '()))

(define (deep_reverse a_list)
    (define (iter a_list result)
        (cond ((null? a_list) result)
              ((pair? (car a_list)) (iter (cdr a_list) 
                                    (cons (iter (car a_list) '())
                                           result)))
              (else (iter (cdr a_list) 
                          (cons (car a_list) result)))))
    (iter a_list '()))

(define (print_reverse a_list)
    (newline)
    (display a_list)
    (display " -- ")
    (display "reverse: ")
    (display (reverse a_list))
    (display " deep-reverse: ")
    (display (deep_reverse a_list)))

; test
(define x (list (list 1 2) (list 3 4)))
(define y (list 1 2 (list 3 4)))

(print_reverse x)
(print_reverse y)
