(define (square x) (* x x))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (sum_of_squares_of_biger_two a b c)
    (cond ((and (> a c) (> b c)) (sum_of_squares a b))
          ((and (> a b) (> c b)) (sum_of_squares a c))
          ((and (> b a) (> c a)) (sum_of_squares b c))))

; from http://community.schemewiki.org/?sicp-ex-1.3
(define (biggest x y) (if (> x y) x y)) 
(define (input x y z) (sum-of-squares (biggest x y) (biggest y z)))

; test
; (sum_of_squares_of_biger_two 1 2 3)
; (sum_of_squares_of_biger_two 2 1 3)
; (sum_of_squares_of_biger_two 3 1 2)