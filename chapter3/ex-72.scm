(define (square_sum a_list) (+ (square (car x)) (square (cadr x))))

(define (squaresn s)
    (define (stream-cadr s) (stream-car (stream-cdr s)))
    (define (stream-cddr s) (stream-cdr (stream-cdr s)))
    (let ((scar (stream-car s))
          (scadr (stream-cadr s))
          (scaddr (stream-caddr s)))
        (if (= (square_sum scar) (square_sum scadr) (square_sum scaddr))
            (cons-stream (list (square_sum scar) scar scadr scaddr)
                         (squaresn (stream-cdr (stream-cdr (stream-cdr s)))))
            (squaresn (stream-cdr s)))))

(define square_number
         (squaresn (weight_pairs integers integers square_sum)))
