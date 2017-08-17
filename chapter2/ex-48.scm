; from ex-46.scm
(define (make_vect x y)
    (cons x y))

(define (xcor_vect vect)
    (car vect))

(define (ycor_vect vect)
    (cdr vect))


(define (make_segment vect1 vect2)
    (cons vect1 vect2))

(define (start_segment segment)
    (car segment))

(define (end_segment segment)
    (cdr segment))

; test
(define (print_vect vect)
    (display "vect: (")
    (display (xcor_vect vect))
    (display ", ")
    (display (ycor_vect vect))
    (display ")"))

(define (print_segment segment)
    (newline)
    (display "segment: [")
    (print_vect (start_segment segment))
    (display ", ")
    (print_vect (end_segment segment))
    (display "]"))

(define vect1 (make_vect 1 2))
(define vect2 (make_vect 3 4))
(define segment (make_segment vect1 vect2))
(print_segment segment)

; 好吧，被我搞复杂了。http://community.schemewiki.org/?sicp-ex-2.48
