(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b))))

(define (intergral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))


(define (simpson f a b n)
    (define (next_n x) (+ x n))
    (define (next_two x) (+ x 2))
    (define (h a b n) (/ (- b a) n))
    (define (g k) (f (+ a (* k (h a b n)))))
    (/ (* (h a b n) (+ (sum g 0 next_n n) 
                       (* 4 (sum g 1 next_two (- n 1))) 
                       (* 2 (sum g 2 next_two (- n 2))))) 3))

; 又跑偏了。不跑偏的解法: http://community.schemewiki.org/?sicp-ex-1.29