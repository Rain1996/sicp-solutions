(define (make_queue)
    (let ((front_ptr '())
          (rear_ptr '()))

        (define (insert item)
            (let ((new_pair (cons item '())))
                (if (null? front_ptr)
                    (begin (set! front_ptr new_pair)
                           (set! rear_ptr new_pair))
                    (begin (set-cdr! rear_ptr new_pair)
                           (set! rear_ptr (cdr rear_ptr)))))
            front_ptr)
        
        (define (delete)
            (if (null? front_ptr)
                (error "DELETE a empty queue" front_ptr)
                (set! front_ptr (cdr front_ptr))))

        (define (dispatch m)
            (cond ((eq? m 'insert) insert)
                  ((eq? m 'delete) (delete))
                  ((eq? m 'empty?) (null? front_ptr))
                  ((eq? m 'display) (display front_ptr))
                  (else (error "Unknown operation -- DISPATCH" m))))
        dispatch))

; test
(define q1 (make_queue))
(newline)
(q1 'display)

((q1 'insert) 'a)
(newline)
(q1 'display)

((q1 'insert) 'b)
(newline)
(q1 'display)

(q1 'delete)
(newline)
(q1 'display)

(q1 'delete)
(newline)
(q1 'display)

(newline)
(display (q1 'empty?))
