(define (or_gate a1 a2 output)
    (define (or_action_procedure)
        (let ((new_value (logic_or (get_signal a1) (get_signal a2))))
            (after_delay or_gate_delay
                (lambda () (set_signal! output new_value)))))
    (add_action! a1 or_action_procedure)
    (add_action! a2 or_action_procedure)
    'ok)

(define (logic_or s1 s2)
    (cond ((or (= s1 1) (= s2 1)) 1)
          ((and (= s1 0) (= s2 0)) 0)
          (else (error "Invalid signal" s))))
