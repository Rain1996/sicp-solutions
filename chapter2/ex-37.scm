(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate_n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
              (accumulate_n op init (map cdr seqs)))))


(define (dot_product v w)
    (accumulate + 0 (map * v w)))

(define (matrix_*_vector m v)
    (map (lambda (w) (dot_product v w)) m))

(define (transpose mat)
    (accumulate_n cons '() mat))

(define (matrix_*_matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (v) (matrix_*_vector cols v)) m)))


; test
(define v1 (list 1 2 3))
(define v2 (list 5 6 7))
(define m1 (list (list 1 2 5)
                 (list 3 4 6)))
(define m2 (list (list 1 2)
                 (list 3 4 )
                 (list 5 6)))

; result: 38
(newline)
(display "result: ")
(display (dot_product v1 v2))

; result: (20 29)
(newline)
(display "result: ")
(display (matrix_*_vector m1 v1))

; result: ((32 40) (45 48))
(newline)
(display "result: ")
(display (matrix_*_matrix m1 m2))

; result: ((1 3) (2 4) (5 6))
(newline)
(display "result: ")
(display (transpose m1))
