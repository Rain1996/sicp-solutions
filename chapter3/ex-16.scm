(define (count_pairs x)
    (if (not (pair? x))
        0
        (+ (count_pairs (car x))
           (count_pairs (cdr x))
           1)))


; pairs1 -> [ . ] -> [ . ] -> [ . ] -> '()
;            |        |        | 
;            v        v        v 
;           'a       'b       'c 
; 3
(define pairs1 '(a b c))
(newline)
(display (count_pairs pairs1))


; pairs2 -> [ | ] -> '() 
;            | 
;            v 
;           [ | ]
;            | | 
;            v v 
;           [ | ] -> '() 
;            | 
;            v
;           'a
; 4
(define x '(a))
(define y (cons x x))
(define pairs2 (list y))
(newline)
(display (count_pairs pairs2))


; str3 -> [ | ] 
;          | | 
;          v v 
;         [ | ] 
;          | | 
;          v v 
;         [ | ] -> '() 
;          | 
;          v 
;         'a
; 7 
(define x '(a)) 
(define y (cons x x)) 
(define pairs3 (cons y y))
(newline)
(display (count_pairs pairs3)) 


;             -------------------
;            |                   |
;            v                   |
; pairs4 -> [ | ] -> [ | ] -> [ | ]
;            |        |        |
;            v        v        v
;           'a       'b       'c
; 不返回
; maximum recursion depth exceeded
(define pairs4 '(a b c)) 
(set-cdr! (cddr pairs4) pairs4)
(count_pairs pairs4)
