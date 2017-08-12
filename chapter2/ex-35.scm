(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate_tree tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))
          (else (append (enumerate_tree (car tree))
                        (enumerate_tree (cdr tree))))))

(define (count_leaves t)
    (accumulate +
                0
                (map (lambda (x) 1)
                     (enumerate_tree t))))

; test
(define x (cons (list 1 2) (list 3 4)))
(newline)
(display (count_leaves x))
(newline)
(display (count_leaves (list x x)))
