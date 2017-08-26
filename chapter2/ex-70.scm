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



(define song_pairs
    '((NA 16) (YIP 9) (SHA 3)
      (A 2) (GET 2) (JOB 2)
      (BOOM 1) (WAH 1)))

(define song_huffman_tree (generate_huffman_tree song_pairs))
(define message1 '(Get a job))
(define message2 '(Sha na na na na na na na na))
(define message3 '(Wah yip yip yip yip yip yip yip yip yip))
(define message4 '(Sha boom))


(define bits1 (encode message1 song_huffman_tree))
(define bits2 (encode message2 song_huffman_tree))
(define bits3 (encode message3 song_huffman_tree))
(define bits4 (encode message4 song_huffman_tree))

(newline)
(display bits1)
(newline)
(display bits2)
(newline)
(display bits3)
(newline)
(display bits4)


; 所得到的编码会因为song_pairs中几个相同权重的字符的放置顺序而不同
; 这里使用 Huffman 编码需要 84 个二进制位
; 使用定长编码的话，这里每个符号需要3个二进制位表示，共有36个符号，所以
; 使用定长编码需要 3 * 36 = 108 个二进制位
