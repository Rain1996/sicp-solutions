; from book
(define (make_mutex)
    (let ((cell (list false)))
        (define (the_mutex m)
            (cond ((eq? m 'acquire)
                   (if (test_and_set! cell)
                       (the_mutex 'acquire)))
                  ((eq? m 'release) (clear! cell))))
        the_mutex))

(define (clear! cell)
    (set-car! cell false))

(define (test_and_set! cell)
    (if (car cell)
        true
        (begin (set-car! cell true) false)))

; a)
(define (make_semaphore_base_of_mutex n)
    (let ((mutex (make_mutex)))
        (define (dispatch operation)
            (cond ((eq? operation 'acquire) (acquire))
                  ((eq? operation 'release) (release))
                  (else (error "Unknown operation DISPATCH" operation))))
        
        (define (acquire)
            (mutex 'acquire)
            (cond ((> n 0) (set! n (- n 1)) (mutex 'release) 'ok)
                  (else (mutex 'release) (acquire))))
        
        (define (release)
            (mutex 'acquire)
            (set! n (+ n 1))
            (mutex 'release)
            'ok)

        dispatch))

; b)
(define (make_semaphore_base_of_cell n)
    (let ((mutex (list false)))
        (define (dispatch operation)
            (cond ((eq? operation 'acquire) (acquire))
                  ((eq? operation 'release) (release))
                  (else (error "Unknown operation DISPATCH" operation))))
        
        (define (acquire)
            (if (test_and_set! mutex)
                (acquire))
            (cond ((> n 0) (set! n (- n 1)) (clear! mutex) 'ok)
                  (else (clear! mutex) (acquire))))
        
        (define (release)
            (if (test_and_set! mutex)
                (release))
            (set! n (+ n 1))
            (clear! mutex)
            'ok)
        
        dispatch))
