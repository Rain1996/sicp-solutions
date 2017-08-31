; scheme - memq:
; this procedure return the first pair of list whose car is object;
; the returned pair is always one from which list is composed. 
; If object does not occur in list, #f (n.b.: not the empty list) is returned.

(define (count_pairs x)
   (let ((help_list '()))
        (define (helper x)
            (if (or (not (pair? x)) (memq x help_list))
                0
                (begin (set! help_list (cons x help_list))
                       (+ (helper (car x))
                          (helper (cdr x))
                          1))))
        (helper x)))

; test
(define pairs1 '(a b c))
(newline)
(display (count_pairs pairs1))

(define x '(a))
(define y (cons x x))
(define pairs2 (list y))
(newline)
(display (count_pairs pairs2))

(define x '(a)) 
(define y (cons x x)) 
(define pairs3 (cons y y))
(newline)
(display (count_pairs pairs3))

(define pairs4 '(a b c)) 
(set-cdr! (cddr pairs4) pairs4)
(newline)
(display (count_pairs pairs4))
