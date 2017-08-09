(define (reverse a_list)
    (define (reverse_iter a_list result)
        (if (null? a_list)
            result
            (reverse_iter (cdr a_list) (cons (car a_list) result))))
    (reverse_iter a_list '()))

; test
(newline)
(display (reverse '()))
(newline)
(display (reverse (list 1)))
(newline)
(display (reverse (list 1 2 3)))