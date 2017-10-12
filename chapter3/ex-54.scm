; 0! = 1
(define factorials (cons-stream 1 (mul-streams integers factorials)))
