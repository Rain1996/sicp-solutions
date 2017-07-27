; 很小的数： 0.00000000001 计算结果不正确
; 很大的数： 1000000000000000000000000000000000000000000000000000000 算不出结果


; 引入let, p42
; 不用let也可以, 每次会多算一次improve
(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? guess improve_guess)
    (< (/ (abs (- guess improve_guess)) guess) 0.001))

(define (sqrt-iter guess x)
    (let ((improve_guess  (improve guess x)))
        (if (good-enough? guess improve_guess)
            guess 
            (sqrt-iter improve_guess x))))

(define (sqrt x) (sqrt-iter 1.0 x))