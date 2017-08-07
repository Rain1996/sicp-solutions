(define (make_interval a b)
    (cons a b))

(define (lower_bound interval)
    (car interval))

(define (upper_bound interval)
    (cdr interval))

(define (print_interval interval)
    (newline)
    (display "[")
    (display (lower_bound interval))
    (display ", ")
    (display (upper_bound interval))
    (display "]"))

; test
(define interval (make_interval 1 2))
(print_interval interval)