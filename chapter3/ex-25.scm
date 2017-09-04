(define (make_table)
    (let ((local_table (list '*table*)))

        ; 对于数值类型，在误差允许范围内认为相等
        (define (same_key? key1 key2)
            (define (close_enough? a b tolerance)
                (< (abs (- a b)) tolerance))
            (let ((tolerance 0.00001))
                (if (and (number? key1) (number? key2))
                    (close_enough? key1 key2 tolerance)
                    (equal? key1 key2))))
        
        ; 查看该表格里是否有以 key 作为关键码的记录
        (define (assoc key records)
            (cond ((null? records) False)
                  ((same_key? key (caar records)) (car records))
                  (else (assoc key (cdr records)))))

        (define (lookup key_list)
            (define (lookup_helper key_list table)
                (let ((record (assoc (car key_list) (cdr table))))
                    (if record
                        (if (null? (cdr key_list))
                            (cdr record)
                            (lookup_helper (cdr key_list) record))
                        False)))
            (lookup_helper key_list local_table))

        (define (insert! key_list value)
            
            ; 辅助函数, 用于生成表格
            (define (create_table key_list value)
                (if (null? (cdr key_list))
                    (cons (car key_list) value)
                    (list (car key_list) (create_table (cdr key_list) value))))
            
            ; 辅助函数
            (define (insert_helper key_list table)
                (let ((record (assoc (car key_list) (cdr table))))
                    (if record
                        (if (null? (cdr key_list))
                            (set-cdr! record value)
                            (insert_helper (cdr key_list) record))
                        (set-cdr! table
                                  (cons (create_table key_list value) (cdr table))))))
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

(operation_table 'table)
