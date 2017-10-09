; create id
(define (counter)
    (let ((i 0))
        (lambda () (set! i (+ i 1)) i)))

(define get_id
    (counter))


(define (make_account_and_serializer balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    
    (let ((id (get_id))                 ; add id
          (balance_serializer (make_serializer)))
        (define (dispatch m)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  ((eq? m 'balance) balance)
                  ((eq? m 'serializer) balance_serializer)
                  ((eq? m 'id) id)      ; add id request
                  (else (error "Unknown request -- MAKE_ACCOUNT" m))))
        dispatch))


(define (exchange account1 account2)
    (let ((difference (- (account1 'balance) (account2 'balance))))
        ((account1 'withdraw) difference)
        ((account2 'deposit) difference)))


(define (serializer_exchange account1 account2)
    (define (helper smaller_id_count bigger_id_count)
        (let ((smaller_serializer (smaller_id_count 'serializer))
              (bigger_serializer (bigger_id_count 'serializer)))
            ((smaller_serializer (bigger_serializer exchange))
             smaller_id_count
             bigger_id_count)))

    (if (< (account1 'id) (account2 'id))
        (helper account1 account2)
        (helper account2 account1)))
