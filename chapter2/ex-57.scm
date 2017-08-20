(define (variable? x) (symbol? x))

(define (same_variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
    (and (number? exp) (= exp num)))

(define (make_sum a1 . a2)
    (cond ((null? a2) (error "Expected two or more argument, but given one"))
          ((sum? (car a2)) (cons '+ (cons a1 (cdar a2))))
          (else (cons '+ (cons a1 a2)))))


(define (make_product m1 . m2)
    (cond ((null? m2) (error "Expected two or more argument, but given one"))
          ((product? (car m2)) (cons '* (cons m1 (cdar m2))))
          (else (cons '* (cons m1 m2)))))

(define (make_exponentiation e1 e2)
    (cond ((or (=number? e2 0) (=number? e1 1)) 1)
          ((=number? e2 1) e1)
          ((and (number? e1) (number? e2)) (expt e1 e2))
          (else (list '** e1 e2))))

(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)
    (if (null? (cdddr s))
        (caddr s)
        (cons '+ (cddr s))))


(define (product? x)
    (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p)
    (if (null? (cdddr p))
        (caddr p)
        (cons '+ (cddr p))))

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

