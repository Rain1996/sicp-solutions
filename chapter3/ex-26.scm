; 树的构造函数
(define (make_tree entry left right)
    (list entry left right))

; 树的选择函数
(define (entry tree) (car tree))
(define (left_branch tree) (cadr tree))
(define (right_branch tree) (caddr tree))

; 树的改变函数
(define (set_left_branch! tree item) (set-car! (cdr tree) item))
(define (set_right_branch! tree item) (set-car! (cddr tree) item))

; 字符串比较函数
(define (compare string1 string2)
    (cond ((string=? string1 string2) 0)
          ((string>? string1 string2) 1)
          ((string<? string1 string2) -1)))

; 树的当前节点的值为 key-value 的cons对
; 比如 (cons 'math 1)
; value 也可为树

; 节点的选择函数
(define (get_key item)
    (car item))

(define (get_value item)
    (cdr item))

; 根据节点的值而写的树的新增节点函数
(define (join_tree tree item)
    (if (null? tree)
        (make_tree item '() '())
        (let ((curr (entry tree))
              (left (left_branch tree))
              (right (right_branch tree)))
            (cond ((> (compare (get_key curr) (get_key item)) 0)
                   (if (null? left)
                       (set_left_branch! tree (make_tree item '() '()))
                       (join_tree left item)))
                  ((< (compare (get_key curr) (get_key item)) 0)
                   (if (null? right)
                       (set_right_branch! tree (make_tree item '() '()))
                       (join_tree right item))))
            tree)))

; 创建表格
(define (make_table)
    (let ((local_table (list '*table*)))
        
        ; 查看该表格里是否有以 key 作为关键码的记录
        (define (assoc key records)
            (if (null? records)
                False
                (let ((compare_result (compare (get_key (entry records)) key)))
                    (cond ((= compare_result 0) (entry records))
                          ((= compare_result 1) (assoc key (left_branch records)))
                          ((= compare_result -1) (assoc key (right_branch records)))))))
        ; 查询
        (define (lookup key_list)
            (define (lookup_helper key_list table)
                (let ((record (assoc (symbol->string (car key_list)) (cdr table))))
                    (if record
                        (if (null? (cdr key_list))
                            (cdr record)
                            (lookup_helper (cdr key_list) record))
                        False)))
            (lookup_helper key_list local_table))

        ; 插入
        (define (insert! key_list value)
            
            ; 辅助函数, 用于生成表格
            (define (create_table key_list value)
                (if (null? (cdr key_list))
                    (cons (symbol->string (car key_list)) value)
                    (cons (symbol->string (car key_list))
                                     (make_tree (create_table (cdr key_list) value) '() '()))))
            
            ; 辅助函数
            (define (insert_helper key_list table)
                (let ((record (assoc (symbol->string (car key_list)) (cdr table))))
                    (if record
                        (if (null? (cdr key_list))
                            (set-cdr! record value)
                            (insert_helper (cdr key_list) record))
                        (set-cdr! table
                                   (join_tree (cdr table) (create_table key_list value))))))
            (insert_helper key_list local_table)
            'ok)

        (define (dispatch m)
            (cond ((eq? m 'lookup_proc) lookup)
                  ((eq? m 'insert_proc) insert!)
                  ((eq? m 'table) local_table)
                  (else (error "Unknown operation -- TABLE" m))))

        dispatch))

; test
(define operation_table (make_table))

((operation_table 'insert_proc) '(math +) 43)
((operation_table 'insert_proc) '(math -) 45)
((operation_table 'insert_proc) '(math *) 42)

((operation_table 'insert_proc) '(letters a) 97)
((operation_table 'insert_proc) '(letters b) 98)

(newline)
(display ((operation_table 'lookup_proc) '(math +)))
(newline)
(display ((operation_table 'lookup_proc) '(letters a)))

((operation_table 'insert_proc) '(three a b) 100)
(newline)
(display ((operation_table 'lookup_proc) '(three a b)))

((operation_table 'insert_proc) '(four a b d) 100)
(newline)
(display ((operation_table 'lookup_proc) '(four a b d)))
(newline)
(display ((operation_table 'lookup_proc) '(four a b e)))

(newline)
(display ((operation_table 'lookup_proc) '(four a c e)))

((operation_table 'insert_proc) '(math +) 42)
(newline)
(display ((operation_table 'lookup_proc) '(math +)))

((operation_table 'insert_proc) '(three a b) 99)
(newline)
(display ((operation_table 'lookup_proc) '(three a b)))

(operation_table 'table)
