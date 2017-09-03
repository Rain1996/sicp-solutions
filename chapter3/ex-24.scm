(define (make_table)
    (let ((local_table (list '*table*)))
        (define (same_key? key1 key2)
            (define (close_enough? a b tolerance)
                (< (abs (- a b)) tolerance))
            (let ((tolerance 0.00001))
                (if (and (number? key1) (number? key2))
                    (close_enough? key1 key2 tolerance)
                    (equal? key1 key2))))

        (define (assoc key records)
            (cond ((null? records) false)
                  ((same_key? key (caar records)) (car records))
                  (else (assoc key (cdr records)))))

        (define (lookup key)
            (let ((record (assoc key (cdr local_table))))
                (if record
                    (cdr record)
                    false)))

        (define (insert! key value)
            (let ((record (assoc key (cdr local_table))))
                (if record
                    (set-cdr! record value)
                    (set-cdr! local_table
                             (cons (cons key value) (cdr local_table)))))
            'ok)

        (define (dispatch m)
            (cond ((eq? m 'lookup_proc) lookup)
                  ((eq? m 'insert_proc) insert!)
                  (else (error "Unknown operation -- TABLE" m))))

        dispatch))

; test
(define operation_table (make_table))
(newline)
(display ((operation_table 'lookup_proc) 'a))

((operation_table 'insert_proc) 'a 1)
((operation_table 'insert_proc) 'b 2)
((operation_table 'insert_proc) 2.0 2)
((operation_table 'insert_proc) 2.1 2)

(newline)
(display ((operation_table 'lookup_proc) 2.00000000000000001))
(newline)
(display ((operation_table 'lookup_proc) 2.01))
(newline)
(display ((operation_table 'lookup_proc) 'b))
