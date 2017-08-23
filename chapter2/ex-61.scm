(define (adjoin_set x set)
    (cond ((null? set) (cons x set))
          ((> x (car set)) (cons (car set) (adjoin_set x (cdr set))))
          ((< x (car set)) (cons x set))
          (else set)))

; test
(newline)
(display (adjoin_set 1 (list 2 3)))

(newline)
(display (adjoin_set 2 (list 1 3)))

(newline)
(display (adjoin_set 3 (list 1 2)))
