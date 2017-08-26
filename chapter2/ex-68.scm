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

(define (element_in? e element_list)
    (cond ((null? element_list) False)
          ((eq? e (car element_list)) True)
          (else (element_in? e (cdr element_list)))))

(define (symbol_in? symbol tree)
    (let ((symbol_list (symbols tree)))
        (element_in? symbol symbol_list)))

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode_symbol (car message) tree)
                (encode (cdr message) tree))))

(define (encode_symbol symbol tree)
    (let ((left (left_branch tree))
          (right (right_branch tree)))
        (cond ((and (leaf? left)
                    (eq? (symbol_leaf left) symbol)) (list 0))
              ((and (leaf? right)
                    (eq? (symbol_leaf right) symbol)) (list 1))
              ((symbol_in? symbol left) (cons 0 (encode_symbol symbol left)))
              ((symbol_in? symbol right) (cons 1 (encode_symbol symbol right)))
              (else (error "bad symbol -- ENCODE_SYMBOL" symbol)))))

; test
(define sample_tree
    (make_code_tree (make_leaf 'A 4)
                    (make_code_tree
                        (make_leaf 'B 2)
                        (make_code_tree (make_leaf 'D 1)
                                        (make_leaf 'C 1)))))

(define sample_message '(A D A B B C A))

(newline)
; (0 1 1 0 0 1 0 1 0 1 1 1 0)
(display (encode sample_message sample_tree))
