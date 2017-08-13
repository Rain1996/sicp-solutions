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

; result: 3/2
(newline)
(display "result: ")
(display (fold_right / 1 (list 1 2 3)))

; result: 1/6
(newline)
(display "result: ")
(display (fold_left / 1 (list 1 2 3)))

; result: (1 (2 (3 ())))
(newline)
(display "result: ")
(display (fold_right list '() (list 1 2 3)))

; result: (((() 1) 2) 3)
(newline)
(display "result: ")
(display (fold_left list '() (list 1 2 3)))

; 要求用某个 op 时保证 fold_left 和 fold_right 对任何序列都能
; 产生同样的结果, op 应该符合结合律
