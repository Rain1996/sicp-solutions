; from ex-2.scm
; point
(define (make_point x y) (cons x y))
(define (x_point point) (car point))
(define (y_point point) (cdr point))


; another implementation
(define (make_rectangle one_point length width)
    (cons one_point (cons length width)))

(define (get_one_point rectangle)
    (car rectangle))

(define (length rectangle)
    (car (cdr rectangle)))

(define (width rectangle)
    (cdr (cdr rectangle)))

(define (get_opposite_point rectangle)
    (make_point (+ (x_point (get_one_point rectangle))
                   (length rectangle))
                (+ (y_point (get_one_point rectangle))
                   (width rectangle))))
(define (perimeter rectangle)
    (* 2 (+ (length rectangle) (width rectangle))))

(define (area rectangle)
    (* (length rectangle) (width rectangle)))

(define (print_rectangle rectangle)
    (newline)
    (display "one point: ")
    (display (get_one_point rectangle))
    (display ", opposite point: ")
    (display (get_opposite_point rectangle))
    (display ", length: ")
    (display (length rectangle))
    (display ", width: ")
    (display (width rectangle))
    (newline)
    (display "perimeter: ")
    (display (perimeter rectangle))
    (display ", area: ")
    (display (area rectangle)))

; test
(define point1 (make_point 1 2))
(define rectangle1 (make_rectangle point1 3 2))

(define point2 (make_point 1 -2))
(define rectangle2 (make_rectangle point2 6 5))

(define point3 (make_point -1 2))
(define rectangle3 (make_rectangle point3 6 5))

(define point7 (make_point -1 -2))
(define rectangle4 (make_rectangle point4 3 2))

(print_rectangle rectangle1)
(print_rectangle rectangle2)
(print_rectangle rectangle3)
(print_rectangle rectangle4)