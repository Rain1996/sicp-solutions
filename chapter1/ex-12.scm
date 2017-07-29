(define (pascal row col)
    (cond ((or (> col row) (< col 0)) 0)
          ((or (= col 1) (= row col)) 1)
          (else (+ (pascal (- row 1) (- col 1)) 
                   (pascal (- row 1) col)))))