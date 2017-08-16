(define (make_vect x y)
    (cons x y))

(define (xcor_vect vect)
    (car vect))

(define (ycor_vect vect)
    (cdr vect))

(define (add_vect vect1 vect2)
    (make_vect (+ (xcor_vect vect1)
                  (xcor_vect vect2))
               (+ (ycor_vect vect1)
                  (ycor_vect vect2))))

(define (sub_vect vect1 vect2)
    (make_vect (- (xcor_vect vect1)
                  (xcor_vect vect2))
               (- (ycor_vect vect1)
                  (ycor_vect vect2))))

(define (scale_vect s vect)
    (make_vect (* s (xcor_vect vect))
               (* s (ycor_vect vect))))

; test
(define (print_vect vect)
    (newline)
    (display "vect: (")
    (display (xcor_vect vect))
    (display ", ")
    (display (ycor_vect vect))
    (display ")"))

(define vect1 (make_vect 1 2))
(define vect2 (make_vect 3 4))
(define add_v (add_vect vect1 vect2))
(define sub_v (sub_vect vect1 vect2))
(define scale_v (scale_vect 2 vect1))
(print_vect vect1)
(print_vect vect2)
(print_vect add_v)
(print_vect sub_v)
(print_vect scale_v)
