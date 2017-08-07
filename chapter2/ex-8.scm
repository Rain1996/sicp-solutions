; from ex-7.scm
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


(define (add_interval x y)
    (make_interval (+ (lower_bound x) (lower_bound y))
                   (+ (upper_bound x) (upper_bound y))))

(define (sub_interval x y)
    (add_interval x (make_interval (- (upper_bound y))
                                   (- (lower_bound y)))))


; test
(define interval1 (make_interval 1 2))
(define interval2 (make_interval 3 4))
(print_interval (sub_interval interval2 interval1))
