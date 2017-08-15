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

(define (get_n_cols n a_list)
    (define (iter n pair)
        (if (= n 0)
            pair
            (iter (- n 1) (cdr pair))))
    (car (iter (- n 1) a_list)))

(define (safe? k positions)
    (define (is_safe cur k)
        (cond ((= cur k) True)
              ((or (= (get_n_cols cur positions)
                      (get_n_cols k positions))
                   (= (abs (/ (- (get_n_cols cur positions)
                                 (get_n_cols k positions))
                           (- cur k)))
                      1))
               False)
              (else (is_safe (+ cur 1) k))))
    (is_safe 1 k))
(define empty_board '())
(define (adjoin_position new_row k rest_of_queens)
    (append rest_of_queens (list new_row)))


(define (queens board_size)
    (define (queens_cols k)
        (if (= k 0)
            (list empty_board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest_of_queens)
                        (map (lambda (new_row)
                                (adjoin_position new_row k rest_of_queens))
                             (enumerate_interval 1 board_size)))
                    (queens_cols (- k 1))))))
    (queens_cols board_size))

; test
(queens 8)

; 虽然解出来了，但是算八皇后时间有点久
; 比较好的解法：https://sicp.readthedocs.io/en/latest/chp2/42.html
