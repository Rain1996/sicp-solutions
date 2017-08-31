; 能写出简洁的代码是技术, =_= 有待加强
; 核心想法是一个走两步一个走一步看是否会相遇
(define (is_cycle x)
    (define (helper slow fast)
        (cond ((null? slow) False)
              ((null? fast) False)
              ((eq? slow fast) True)
              ((or (null? (cdr fast)) (null? (cddr fast))) False)
              (else (helper (cdr slow) (cddr fast)))))

    (cond ((null? x) False)
          ((or (null? (cdr x)) (null? (cddr x))) False)
          (else (helper x (cddr x)))))


; test
(define pairs1 '(a b c))
(newline)
(display (is_cycle pairs1))

; test
(define pairs4 '(a b c)) 
(set-cdr! (cddr pairs4) pairs4)
(newline)
(display (is_cycle pairs4))
