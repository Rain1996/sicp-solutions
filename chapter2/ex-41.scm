; from ex-2.33
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

; from ex-2.40
(define (enumerate_interval low high)
    (if (> low high)
        '()
        (cons low (enumerate_interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (unique_pairs n)
    (accumulate append
                '()
                (flatmap (lambda (i)
                            (map (lambda (j)
                                    (map (lambda (k)
                                            (list i j k))
                                          (enumerate_interval 1 (- j 1))))
                                 (enumerate_interval 1 (- i 1))))
                         (enumerate_interval 1 n))))


(define (pair_sum_equal_s n s)
    (define (sum_equal_s? pair)
        (= (+ (car pair) (cadr pair) (caddr pair)) s))
    (filter sum_equal_s? (unique_pairs n)))


; test
(define pair (pair_sum_equal_s 6 10))
(newline)
(display pair)
