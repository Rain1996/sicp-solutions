(define (split combine1 combine2)
    (define (split_help painter n)
        (if (= n 0)
            painter
            (let ((smaller (split_help painter (- n 1))))
                (combine1 painter (combine2 smaller smaller)))))
    split_help)

(define right_split (split beside below))
(define up_split (split below beside))
