; from book
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


(define (adjoin_set x set)
    (cond ((null? set) (list x))
          ((< (weight x) (weight (car set))) (cons x set))
          (else (cons (car set)
                      (adjoin_set x (cdr set))))))

(define (make_leaf_set pairs)
    (if (null? pairs)
        '()
        (let ((pair (car pairs)))
            (adjoin_set (make_leaf (car pair)
                                   (cadr pair))
                        (make_leaf_set (cdr pairs))))))



(define (generate_huffman_tree pairs)
    (successive_merge (make_leaf_set pairs)))


(define (successive_merge leaf_set)
    (cond ((= 0 (length leaf_set)) '())
          ((= 1 (length leaf_set)) (car leaf_set))
          (else (successive_merge
                    (adjoin_set (make_code_tree (car leaf_set)
                                                (cadr leaf_set)) 
                                (cddr leaf_set))))))

; test
(define pairs1 '((H 7) (A 4) (B 2) (C 1) (D 1)))
(newline)
(display (generate_huffman_tree pairs1))

(define pairs2 '())
(newline)
(display (generate_huffman_tree pairs2))

(define pairs3 '((H 9)))
(newline)
(display (generate_huffman_tree pairs3))
