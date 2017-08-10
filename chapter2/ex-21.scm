(define (square_list items)
    (if (null? items)
        '()
        (cons (square (car items))
              (square_list (cdr items)))))

(define (square_list items)
    (map (lambda (x) (square x)) items))

; test
(square_list (list 1 2 3 4))
