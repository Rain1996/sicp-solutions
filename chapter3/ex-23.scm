(define (front_ptr deque)
    (car deque))

(define (rear_ptr deque)
    (cdr deque))

(define (set_front_ptr! deque item)
    (set-car! deque item))

(define (set_rear_ptr! deque item)
    (set-cdr! deque item))

(define (empty_deque? deque)
    (null? (front_ptr deque)))

(define (make_deque) (cons '() '()))

(define (front_deque deque)
    (if (empty_deque? deque)
        (error "FRONT_DEQUE called with an empty deque" deque)
        (cadr (front_ptr deque))))

(define (rear_deque deque)
    (if (empty_deque? deque)
        (error "REAR_DEQUE called with an empty deque" deque)
        (cadr (rear_ptr deque))))

(define (front_insert_deque! deque item)
    (let ((new_pair (cons '() (cons item (front_ptr deque)))))
        (cond ((empty_deque? deque)
               (set_front_ptr! deque new_pair)
               (set_rear_ptr! deque new_pair)
               deque)
              (else (set-car! (front_ptr deque) new_pair)
                    (set_front_ptr! deque new_pair)
                    deque))))

(define (rear_insert_deque! deque item)
    (let ((new_pair (cons (rear_ptr deque) (cons item '()))))
        (cond ((empty_deque? deque)
               (set_front_ptr! deque new_pair)
               (set_rear_ptr! deque new_pair)
               deque)
              (else (set-cdr! (cdr (rear_ptr deque)) new_pair)
                    (set_rear_ptr! deque new_pair)
                    deque))))

(define (front_delete_deque! deque)
    (cond ((empty_deque? deque)
           (error "FRONT_DELETE_DEQUE! called with an empty deque" deque))
          ((eq? (front_ptr deque) (rear_ptr deque))
            (set_front_ptr! deque '())
            (set_rear_ptr! deque '())
            deque)
          (else (set_front_ptr! deque (cddr (front_ptr deque)))
                deque)))

(define (rear_delete_deque! deque)
    (cond ((empty_deque?  deque)
           (error "REAR_DELETE_DEQUE! called with an empty deque" deque))
          ((eq? (front_ptr deque) (rear_ptr deque))
           (set_front_ptr! deque '())
           (set_rear_ptr! deque '())
           deque)
          (else (set_rear_ptr! deque (car (rear_ptr deque)))
                deque)))


(define (print_deque deque)
    (define (iter queue result)
        (cond ((null? queue)
               (display result))
              ((eq? queue (rear_ptr deque))
               (display (append result (list (cadr queue)))))
              (else
               (iter (cddr queue) (append result (list (cadr queue)))))))
    (iter (front_ptr deque) '()))

; test
(define q1 (make_deque))
(newline)
(print_deque q1)

(front_insert_deque! q1 'a)
(newline)
(print_deque q1)


(rear_insert_deque! q1 'b)
(newline)
(print_deque q1)

(front_insert_deque! q1 'c)
(newline)
(print_deque q1)

(front_insert_deque! q1 'd)
(newline)
(print_deque q1)


(front_delete_deque! q1)
(newline)
(print_deque q1)

(front_delete_deque! q1)
(newline)
(print_deque q1)

(rear_delete_deque! q1)
(newline)
(print_deque q1)

(rear_delete_deque! q1)
(newline)
(print_deque q1)
