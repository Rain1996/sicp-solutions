; a) 使用 number? 和 variable? 就可以对 scheme 的数字类型及符号类型进行判断
;    不需要在将这两个加入到数据导向的分派上

; b)

(define (attach_tag type_tag contents)
    (cons type_tag contents))

(define (type_tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum -- TYPE_TAG" datum)))

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum -- CONTENTS" datum)))


(define (install_sum_package)
    ; internal procedures 
    (define (addend s)
        (car s))

    (define (augend s)
        (cadr s))

    (define (make_sum x y)
        (cond ((=number? x 0) y)
              ((=number? y 0) x)
              ((and (number? x) (number? y)) (+ x y))
              (else (attach_tag '+ x y))))

    ; interface to the rest of the system
    (put 'addend '+ addend)
    (put 'augend '+ augend)
    (put 'make_sum '+ make_sum)

    (put 'deriv '+
        (lambda (exp var)
            (make_sum (deriv (addend exp) var)
                      (deriv (augend exp) var))))
    'done)

(define (make_sum x y)
    ((get 'make_sum '+) x y))

(define (addend sum)
    ((get 'addend '+) (contents sum)))

(define (augend sum)
    ((get 'augend '+) (contents sum)))


(define (install_product_package)
    ; internal procedures
    (define (multiplier p)
        (car p))

    (define (multiplicand p)
        (cadr p))

    (define (make_product x y)
        (cond ((or (=number? x 0) (=number? y 0)) 0)
              ((=number? x 1) y)
              ((=number? y 1) x)
              ((and (number? x) (number? y)) (* x y))
              (else (attach_tag '* x y))))

    ; interface to the rest of the system
    (put 'multiplier '* multiplier)
    (put 'multiplicand '* multiplicand)
    (put 'make_product '* make_product)

    (put 'deriv '*
        (lambda (exp var)
            (make_sum
                (make_product (multiplier exp)
                              (deriv (multiplicand exp) var))
                (make_product (deriv (multiplier exp) var)
                              (multiplicand exp)))))
    'done)

(define (make_product x y)
    ((get 'make_product '*) x y))

(define (multiplier product)
    ((get 'multiplier '*) (contents product)))

(define (multiplicand product)
    ((get 'multiplicand '*) (contents product)))


; c)

(define (install_exponentiation_package)
    ; internal procedures
    (define (base exp) (car exp))

    (define (exponent exp) (cadr exp))

    (define (make_exponentiation base n)
        (cond ((= n 0) 0)
              ((= n 1) base)
              (else (attach_tag '** base n))))

    ; interface to the rest of the system
    (put 'base '** base)
    (put 'exponent '** exponent)
    (put 'make_exponentiation '** make_exponentiation)

    (put 'deriv '**
         (lambda (exp var)
            (let ((n (exponent exp))
                  (u (base exp)))
                (make_product
                    n
                    (make_product
                        (make_exponentiation u (- n 1))
                        (deriv u var))))))

    'done)

(define (make_exponentiation base n)
    ((get 'make_exponentiation '**) base n))

(define (base exp)
    ((get 'base '**) (contents exp)))

(define (exponent exp)
    ((get 'exponent '**) (contents exp)))

; d) 在使用 put 的地方调换顺序
