(define (make_mobile left right)
    (list left right))

(define (make_branch length structure)
    (list length structure))

(define (left_branch mobile)
    (car mobile))

(define (right_branch mobile)
    (cadr mobile))

(define (branch_length branch)
    (car branch))

(define (branch_structure branch)
    (cadr branch))


(define (weight branch)
    (let ((structure (branch_structure branch)))
        (if (pair? structure)
            (total_weight structure)
            structure)))

(define (total_weight mobile)
    (+ (weight (left_branch mobile))
       (weight (right_branch mobile))))

(define (balance? branch)
    (let ((structure (branch_structure branch)))
        (if (pair? structure)
            (is_balance structure)
            True)))

(define (is_balance mobile)
    (let ((left (left_branch mobile))
          (right (right_branch mobile)))
        (if (and (balance? left) (balance? right))
            (= (* (branch_length left) (weight left))
               (* (branch_length right) (weight right)))
            False)))

(define (print_mobile mobile)
    (newline)
    (display "weight: ")
    (display (total_weight mobile))
    (if (is_balance mobile)
        (display " is_balance: balance")
        (display " is_balance: unbalance")))

; d) 只需改变 right_branch 和 branch_structure

; test
(define branch1 (make_branch 3 2))
(define branch2 (make_branch 1 2))
(define branch3 (make_branch 1 4))
(define mobile1 (make_mobile branch2 branch3))
(define branch4 (make_branch 1 mobile1))
(define mobile2 (make_mobile branch4 branch1))

; weight: 8 is_balance: unbalance
(print_mobile mobile2)

(define branch5 (make_branch 3 2))
(define branch6 (make_branch 1 2))
(define branch7 (make_branch 1 3))
(define mobile3 (make_mobile branch6 branch7))
(define branch8 (make_branch 2 mobile3))
(define mobile4 (make_mobile branch5 branch8))

; weight: 7 is_balance: unbalance
(print_mobile mobile4)

(define branch9 (make_branch 3 2))
(define branch10 (make_branch 2 3))
(define branch11 (make_branch 5 4))
(define mobile5 (make_mobile branch9 branch10))
(define branch12 (make_branch 4 mobile5))
(define mobile6 (make_mobile branch12 branch11))

; weight: 9 is_balance: balance
(print_mobile mobile6)
