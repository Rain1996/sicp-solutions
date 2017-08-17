; 把 segment_list 写出来就行

; a)
(define vect1 (make_vect 0 0))
(define vect2 (make_vect 1 0))
(define vect3 (make_vect 0 1))
(define vect4 (make_vect 1 1))
(define segment_list
    (list (make_segment vect1 vect2)
          (make_segment vect2 vect3)
          (make_segment vect3 vect4)
          (make_segment vect4 vect1)))

; b)
(define vect1 (make_vect 0 0))
(define vect2 (make_vect 1 0))
(define vect3 (make_vect 0 1))
(define vect4 (make_vect 1 1))
(define segment_list
    (list (make_segment vect1 vect4)
          (make_segment vect2 vect3)))

; c)
(define vect1 (make_vect 0.5 0))
(define vect2 (make_vect 1 0.5))
(define vect3 (make_vect 0.5 1))
(define vect4 (make_vect 0 0.5))
(define segment_list
    (list (make_segment vect1 vect2)
          (make_segment vect2 vect3)
          (make_segment vect3 vect4)
          (make_segment vect4 vect1)))

; d)
; 不写了T_T
