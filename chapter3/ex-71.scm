(define (cube x) (* x x x))
(define (cube_sum x y) (+ (cube x) (cube y)))

(define (Ramanujan s)
    (define (stream-cadr s) (stream-car (stream-cdr s))) 
    (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
    (let ((scar (stream-car s)) 
          (scadr (stream-cadr s))) 
        (if (= (cube_sum scar) (cube_sum scadr))  
            (cons-stream (list (cube_sum scar) scar scadr) 
                         (Ramanujan (stream-cddr s))) 
            (Ramanujan (stream-cdr s)))))


(define Ramanujan_number (Ramanujan (weight_pairs integers integers cube_sum)))

; 随后的五个数
; (4104 (2 16) (9 15)) 
; (13832 (2 24) (18 20)) 
; (20683 (10 27) (19 24)) 
; (32832 (4 32) (18 30)) 
; (39312 (2 34) (15 33))
