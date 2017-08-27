(define (install_scheme_number_package)
    ; 省略跟书本相同的代码...
    
    (put 'equ? '(scheme-number scheme-number) =)

    'done)

(define (install_rational_package)
    ; 省略跟书本相同的代码...

    (define (rat_equ? x y)
        (= (* (number x) (denom y))
           (* (number y) (denom x))))

    (put 'equ '(rational rational) rat_equ?)
    
    'done)

(define (install_complex_package)
    ; 省略跟书本相同的代码...

    (define (complex_equ? x y)
        (and (= (real_part x) (real_part y))
             (= (imag_part x) (imag_part y))))
    
    (put 'equ '(complex complex) complex_equ?)
    (put 'real_part '(complex) real_part)
    (put 'imag_part '(complex) imag_part)

    'done)

(define (equ? x y) (apply_generic 'equ? x y))
