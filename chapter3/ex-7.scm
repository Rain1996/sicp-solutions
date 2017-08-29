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
                  ((eq? m 'join) 'ok)
                  (else (error "Unknown request -- MAKE_ACCOUNT" m)))
            (lambda (amount) "Incorrect password")))

    dispatch)

(define (make_joint account password another_password)
    (define (dispatch p m)
        (if (eq? p another_password)
            (cond ((eq? m 'withdraw) (account password 'withdraw))
                  ((eq? m 'deposit) (account password 'deposit))
                  (else (error "Unknown request -- MAKE_ACCOUNT" m)))
            (lambda (amount) "Incorrect password")))
    (if (eq? 'ok (account password 'join))
        dispatch
        (error "Incorrect password")))

; test
(define peter_acc (make_account 100 'open-sesame))
(define paul_acc (make_joint peter_acc 'open-sesame 'rosebud))
(newline)
(display ((peter_acc 'open-sesame 'withdraw) 40))
(newline)
(display ((paul_acc 'rosebud 'withdraw) 40))

(newline)
(display ((paul_acc 'wrong 'withdraw) 40))

(define paul_acc (make_joint peter_acc 'wrong 'rosebud))
