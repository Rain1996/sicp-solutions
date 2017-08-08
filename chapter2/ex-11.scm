(define (make_interval a b)
    (if (> a b)
        (cons b a)
        (cons a b)))
(define (lower_bound interval)
    (car interval))

(define (upper_bound interval)
    (cdr interval))

(define (mul_interval_old x y)
    (let ((p1 (* (lower_bound x) (lower_bound y)))
          (p2 (* (lower_bound x) (upper_bound y)))
          (p3 (* (upper_bound x) (lower_bound y)))
          (p4 (* (upper_bound x) (upper_bound y))))
        (make_interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))))

(define (mul_interval x y)
    (let ((a (lower_bound x))
          (b (upper_bound x))
          (c (lower_bound y))
          (d (upper_bound y)))
        (cond ((> a 0)
                    (cond ((> c 0) (make_interval (* a c) (* b d)))
                          ((< d 0) (make_interval (* b c) (* a d)))
                          (else    (make_interval (* b c) (* b d)))))
              ((< b 0)
                    (cond ((> c 0) (make_interval (* a d) (* b c)))
                          ((< d 0) (make_interval (* b d) (* a c)))
                          (else    (make_interval (* a d) (* a c)))))
              (else
                    (cond ((> c 0) (make_interval (* a d) (* b d)))
                          ((< d 0) (make_interval (* b c) (* a c)))
                          (else    (let ((p1 (* a c))
                                         (p2 (* a d))
                                         (p3 (* b c))
                                         (p4 (* b d)))
                                        (make_interval (min p1 p2 p3 p4)
                                                       (max p1 p2 p3 p4)))))))))

(define (print_interval interval)
    (newline)
    (display "[")
    (display (lower_bound interval))
    (display ", ")
    (display (upper_bound interval))
    (display "]"))

(define (interval_equal? x y)
    (and (= (lower_bound x) (lower_bound y))
         (= (upper_bound x) (upper_bound y))))

; test
(define interval1 (make_interval 1 2))
(define interval2 (make_interval -1 1))
(define interval3 (make_interval -2 -1))
(define interval4 (make_interval 3 4))
(define interval5 (make_interval -3 3))
(define interval6 (make_interval -4 -3))

(print_interval (mul_interval interval1 interval4))
(display (interval_equal? (mul_interval interval1 interval4)
                          (mul_interval_old interval1 interval4)))

(print_interval (mul_interval interval1 interval5))
(display (interval_equal? (mul_interval interval1 interval5)
                          (mul_interval_old interval1 interval5)))

(print_interval (mul_interval interval1 interval6))
(display (interval_equal? (mul_interval interval1 interval6)
                          (mul_interval_old interval1 interval6)))

(print_interval (mul_interval interval2 interval4))
(display (interval_equal? (mul_interval interval2 interval4)
                          (mul_interval_old interval2 interval4)))

(print_interval (mul_interval interval2 interval5))
(display (interval_equal? (mul_interval interval2 interval5)
                          (mul_interval_old interval2 interval5)))

(print_interval (mul_interval interval2 interval6))
(display (interval_equal? (mul_interval interval2 interval6)
                          (mul_interval_old interval2 interval6)))

(print_interval (mul_interval interval3 interval4))
(display (interval_equal? (mul_interval interval3 interval4)
                          (mul_interval_old interval3 interval4)))

(print_interval (mul_interval interval3 interval5))
(display (interval_equal? (mul_interval interval3 interval5)
                          (mul_interval_old interval3 interval5)))

(print_interval (mul_interval interval3 interval6))
(display (interval_equal? (mul_interval interval3 interval6)
                          (mul_interval_old interval3 interval6)))
