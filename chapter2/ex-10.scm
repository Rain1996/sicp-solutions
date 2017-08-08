(define (make_interval a b)
    (if (> a b)
        (cons b a)
        (cons a b)))
(define (lower_bound interval)
    (car interval))

(define (upper_bound interval)
    (cdr interval))

(define (mul_interval x y)
    (let ((p1 (* (lower_bound x) (lower_bound y)))
          (p2 (* (lower_bound x) (upper_bound y)))
          (p3 (* (upper_bound x) (lower_bound y)))
          (p4 (* (upper_bound x) (upper_bound y))))
        (make_interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))))

(define (div_interval x y)
    (let ((y_upper_bound (upper_bound y))
          (y_lower_bound (lower_bound y)))
        (if (and (<= y_lower_bound 0) (>= y_upper_bound 0))
            (error "error: can't division by interval spanning 0 -- " y)
            (mul_interval x
                          (make_interval (/ 1.0 (upper_bound y))
                                         (/ 1.0 (lower_bound y)))))))

(define (print_interval interval)
    (newline)
    (display "[")
    (display (lower_bound interval))
    (display ", ")
    (display (upper_bound interval))
    (display "]"))

; test
(define interval1 (make_interval 1 3)) 
(define interval2 (make_interval 5 4))
(define interval3 (make_interval -1 1))

; [1.333333333333333, 5.]
(print_interval (div_interval interval2 interval1))

; error: can't division by interval spanning 0 -- (-1 . 1)
(print_interval (div_interval interval1 interval3))
