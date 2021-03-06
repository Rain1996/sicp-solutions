; a || b == ~(~a && ~b)
(define (or_gate a b output)
    (let ((c (make_wire))
          (d (make_wire))
          (e (make_wire)))
        (inverter a c)
        (inverter b d)
        (or_gate c d e)
        (inverter e output)
        'ok))

; or_gate_delay = 3 * inverter_delay + and_gate_delay
