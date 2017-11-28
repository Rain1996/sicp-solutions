; point
(define (make_point x y) (cons x y))
(define (x_point point) (car point))
(define (y_point point) (cdr point))

; segment
(define (make_segment start_point end_point)
    (cons start_point end_point))
(define (start_segment segment)
    (car segment))
(define (end_segment segment)
    (cdr segment))

(define (midpoint_segment segment)
    (define (average x y) (/ (+ x y) 2))
    (make_point (average (x_point (start_segment segment))
                         (x_point (end_segment segment)))
                (average (y_point (start_segment segment))
                         (y_point (end_segment segment)))))

(define (print_point p)
    (newline)
    (display "(")
    (display (x_point p))
    (display ", ")
    (display (y_point p))
    (display ")"))

; test
(define start1 (make_point 1 2))
(define end1 (make_point 3 4))
(define segment1 (make_segment start1 end1))

(define start2 (make_point 1 -2))
(define end2 (make_point -3 4))
(define segment2 (make_segment start2 end2))

(define start3 (make_point -1 2))
(define end3 (make_point 3 -4))
(define segment3 (make_segment start3 end3))

(define start4 (make_point -1 -2))
(define end4 (make_point -3 -4))
(define segment4 (make_segment start4 end4))

(print_point (midpoint_segment segment1))
(print_point (midpoint_segment segment2))
(print_point (midpoint_segment segment3))
(print_point (midpoint_segment segment4))
