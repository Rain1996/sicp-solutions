(define (fringe tree)
    (cond ((null? tree) '())
          ((pair? (car tree)) (append (fringe (car tree)) (fringe (cdr tree))))
          (else (cons (car tree) (fringe (cdr tree))))))

; test
(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
