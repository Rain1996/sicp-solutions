(define (make_interval a b)
    (if (> a b)
        (cons b a)
        (cons a b)))
(define (lower_bound interval)
    (car interval))

(define (upper_bound interval)
    (cdr interval))


(define (make_center_percent c p)
    (let ((width (/ (* c p) 100)))
        (make_interval (- c width)
                       (+ c width))))

(define (center interval)
    (/ (+ (lower_bound interval) (upper_bound interval)) 2))

(define (percent interval)
    (define c (center interval))
    (define width (- c (lower_bound interval)))
    (/ (* width 100) c))
