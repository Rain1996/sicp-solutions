(define (variable? x) (symbol? x))

(define (same_variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
    (and (number? exp) (= exp num)))

(define (make_sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

(define (make_product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))

(define (make_exponentiation e1 e2)
    (cond ((or (=number? e2 0) (=number? e1 1)) 1)
          ((=number? e2 1) e1)
          ((and (number? e1) (number? e2)) (expt e1 e2))
          (else (list '** e1 e2))))

(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
    (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '**)))
(define (base e) (cadr e))
(define (exponent e) (caddr e))

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
            (if (same_variable? exp var) 1 0))
          ((sum? exp)
            (make_sum (deriv (addend exp) var)
                      (deriv (augend exp) var)))
          ((product? exp)
            (make_sum
                (make_product (multiplier exp)
                              (deriv (multiplicand exp) var))
                (make_product (deriv (multiplier exp) var)
                              (multiplicand exp))))
          ((exponentiation? exp)
            (make_product
                (make_product (exponent exp)
                              (make_exponentiation (base exp)
                                                   (- (exponent exp) 1)))
                (deriv (base exp) var)))
          (else
            (error "unknown expression type -- DERIV" exp))))

; test
(newline)
(display (deriv '(+ x 3) 'x))
(newline)
(display (deriv '(* x y) 'x))
(newline)
(display (deriv '(** (* 2 x) 3) 'x))
