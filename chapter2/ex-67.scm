(define (make_leaf symbol weight)
    (list 'leaf symbol weight))

(define (leaf? object)
    (eq? (car object) 'leaf))
(define (symbol_leaf x) (cadr x))
(define (weight_leaf x) (caddr x))

(define (make_code_tree left right)
    (list left
          right
          (append (symbols left) (symbols right))
          (+ (weight left) (weight right))))

(define (left_branch tree) (car tree))
(define (right_branch tree) (cadr tree))

(define (symbols tree)
    (if (leaf? tree)
        (list (symbol_leaf tree))
        (caddr tree)))

(define (weight tree)
    (if (leaf? tree)
        (weight_leaf tree)
        (cadddr tree)))


(define (decode bits tree)
    (define (decode_l bits current_branch)
        (if (null? bits)
            '()
            (let ((next_branch
                    (choose_branch (car bits) current_branch)))
                (if (leaf? next_branch)
                    (cons (symbol_leaf next_branch)
                          (decode_l (cdr bits) tree))
                    (decode_l (cdr bits) next_branch)))))
    (decode_l bits tree))

(define (choose_branch bit branch)
    (cond ((= bit 0) (left_branch branch))
          ((= bit 1) (right_branch branch))
          (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define sample_tree
    (make_code_tree (make_leaf 'A 4)
                    (make_code_tree
                        (make_leaf 'B 2)
                        (make_code_tree (make_leaf 'D 1)
                                        (make_leaf 'C 1)))))

(define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(newline)
; (A D A B B C A)
(display (decode sample_message sample_tree))
