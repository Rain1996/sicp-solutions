(define (make_account balance password)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))

    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)

    (define (dispatch p m)
        (if (eq? p password)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  (else (error "Unknown request -- MAKE_ACCOUNT" m)))
            (lambda (amount) "Incorrect password")))

    dispatch)

; test
(define acc (make_account 100 'secret-password))
(newline)
(display ((acc 'secret-password 'withdraw) 40))
(newline)
(display ((acc 'some-other-password 'deposit) 50))
