; ripple_carry_adder = full_adder_delay
;                    = or_gate_delay + 2 * (half_adder_delay)
;                    = or_gate_delay + 2 * (or_gate_delay + inveter_delay + (2 * and_gate_delay))
;                    = or_gate_delay + 2 * or_gate_delay + 2 * inveter_delay + 4 * and_gate_delay
;                    = 3 * or_gate_delay + 2 * inveter_delay + 4 * and_gate_delay
