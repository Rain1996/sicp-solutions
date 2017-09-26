(define (squarer a b)
    (define (process_new_value)
        (if (has_value? b)
            (if (< (get_value b) 0)
                (error "square less than 0 -- SQUARER" (get_value b))
                (set_value! a (sqrt (get_value b)) me))
            (if (has_value? a)
                (set_value! b (square (get_value a)) me))))
    
    (define (process_forget_value)
        (forget_value! a me)
        (forget_value! b me)
        (process_new_value))
    
    (define (me request)
        (cond ((eq? request 'I-have-a-value)
               (process_new_value))
              ((eq? request 'I-lost-my-value)
               (process_forget_value))
              (else
                (error "Unknown request -- SQUARER" request))))

    (connect a me)
    (connect b me)
    me)

; test
(define A (make_connector))
(define B (make_connector))

(squarer A B)

(probe "A" A)
(probe "B" B)

(set_value! A 10 'user)
(forget_value! A 'user)
(set_value! B 25 'user)
