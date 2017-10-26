; 中文版的翻译有问题，y的初始值y0和dy0, 以及dy/dt为参数应该改为
; y的初始值y0, 以及dy/dt的初始值dy0为参数
; 原文为:
; Write a procedure solve-2nd that takes as arguments the constants a, b, 
; and dt and the initial values y0 and dy0 for y and dy/dt and generates 
; the stream of successive values of y.

(define (solve_2nd a b y0 dy0 dt)
    (define y (integral (delay dy) y0 dt))
    (define dy (integral (delay ddy) dy0 dt))
    (define ddy (add-streams (scale-stream dy a)
                             (scale-stream y b)))
    y)
