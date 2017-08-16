; from ex-46.scm
(define (make_vect x y)
    (cons x y))

(define (xcor_vect vect)
    (car vect))

(define (ycor_vect vect)
    (cdr vect))

(define (make_frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

(define (origin_frame frame)
    (car frame))

(define (edge1_frame frame)
    (cadr frame))

(define (edge2_frame frame)
    (cddr frame))

; test
; from ex-46.scm
(define (print_vect vect)
    (display "vect: (")
    (display (xcor_vect vect))
    (display ", ")
    (display (ycor_vect vect))
    (display ")"))

(define (print_frame frame)
    (newline)
    (display "frame: [")
    (print_vect (origin_frame frame))
    (display ", ")
    (print_vect (edge1_frame frame))
    (display ", ")
    (print_vect (edge2_frame frame))
    (display "]"))

(define frame1 (make_frame (make_vect 1 1)
                           (make_vect 1 0)
                           (make_vect 0 1)))
(print_frame frame1)