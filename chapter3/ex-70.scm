(define (merge_weighted s1 s2 weight)
    (cond ((stream-null? s1) s2)
          ((stream-null? s1) s1)
          (else
            (let ((weight1 (weight (stream-car s1)))
                  (weight2 (weight (stream-car s2))))
                (cond ((< weight1 weight2)
                       (cons-stream weight1 (merge_weighted (stream-cdr s1) s2) weight))
                      ((< weight2 weight1) 
                       (cons-stream weight2 (merge_weighted s1 (stream-cdr s2) weight)))
                      (else 
                        (cons-stream weight1 (merge_weighted (stream-cdr s1) (stream-cdr s2) weight))))))))

(define (weight_pairs s t weight)
    (cons-stream (list (stream-car s) (stream-car t))
                 (merge_weighted
                    (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
                    (weight_pairs (stream-cdr s) (stream-cdr t) weight))))


; a)
(define pairs1 (weight_pairs integers integers (lambda (x) (+ (cdr x) (cadr x)))))

; b)
(define weight (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x) (cadr x)))))
(define (divide? x y) (= (remainder y x) 0))
(define stream235
        (stream-filter (lambda (x) (not (or (divide? 2 x) (divide? 3 x) (divide? 5 x)))) integers))
(define pairs2 (weighted_pairs stream235 stream235 weight))
