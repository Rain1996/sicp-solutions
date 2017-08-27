(define (attach_tag type_tag contents)
    (if (eq? type_tag 'scheme-number)
        contents
        (cons type_tag contents)))

(define (type_tag datum)
    (cond ((number? datum) 'scheme-number)
          ((pair? datum) (car datum))
          (else (error "Bad tagged datum -- TYPE_TAG" datum))))

(define (contents datum)
    (cond ((number? datum) datum)
          ((pair? datum) (cdr datum))
          (else (error "Bad tagged datum -- CONTENTS" datum))))
