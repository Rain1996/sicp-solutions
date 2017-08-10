(define (for_each proc items)
    (cond ((null? items) True)
          (else (proc (car items)) (for_each proc (cdr items)))))

; test
(for_each (lambda (x) (newline) (display x)) (list 57 132 88))
