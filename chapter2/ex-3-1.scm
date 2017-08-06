; from ex-2.scm
; point
(define (make_point x y) (cons x y))
(define (x_point point) (car point))
(define (y_point point) (cdr point))

; one implementation
(define (make_rectangle one_point opposite_point)
    (cons one_point opposite_point))

(define (get_one_point rectangle)
    (car rectangle))

(define (get_opposite_point rectangle)
    (cdr rectangle))

(define (length rectangle) 
    (abs (- (x_point (get_one_point rectangle))
            (x_point (get_opposite_point rectangle)))))

(define (width rectangle)
    (abs (- (y_point (get_one_point rectangle))
            (y_point (get_opposite_point rectangle)))))

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
(define point2 (make_point 4 4))
(define rectangle1 (make_rectangle point1 point2))

(define point3 (make_point 1 -2))
(define point4 (make_point -4 4))
(define rectangle2 (make_rectangle point3 point4))

(define point5 (make_point -1 2))
(define point6 (make_point 4 -4))
(define rectangle3 (make_rectangle point5 point6))

(define point7 (make_point -1 -2))
(define point8 (make_point -4 -4))
(define rectangle4 (make_rectangle point7 point8))

(print_rectangle rectangle1)
(print_rectangle rectangle2)
(print_rectangle rectangle3)
(print_rectangle rectangle4)
