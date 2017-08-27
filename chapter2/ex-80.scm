(define (install_scheme_number_package)
    ; 省略跟书本相同的代码...
    
    (put '=zero? '(scheme-number)
        (lambda (x) (= x 0)))

    'done)

(define (install_rational_package)
    ; 省略跟书本相同的代码...

    (put '=zero? '(rational)
        (lambda (x) (= 0 (number? x))))
    
    'done)

(define (install_complex_package)
    ; 省略跟书本相同的代码...

    (define (=zero? x)
        (and (= (real_part x) 0)
             (= (imag_part x) 0)))
    
    (put 'equ '(complex) =zero?)
    (put 'real_part '(complex) real_part)
    (put 'imag_part '(complex) imag_part)

    'done)

(define (=zero? x) (apply_generic '=zero? x))
