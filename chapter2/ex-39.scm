(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define fold_right accumulate)

(define (fold_left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))

(define (reverse_use_fold_left sequence)
    (fold_left (lambda (x y) (cons y x)) '() sequence))

(define (reverse_use_fold_right sequence)
    (fold_right (lambda (x y) (append y (list x))) '() sequence))

; test
(define l (list 1 2 3 4))

; result: (4 3 2 1)
(newline)
(display "result: ")
(display (reverse_use_fold_left l))

; result: (4 3 2 1)
(newline)
(display "result: ")
(display (reverse_use_fold_right l))
