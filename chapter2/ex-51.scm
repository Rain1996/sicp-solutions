(define (below painter1 painter2)
    (let ((split_point (make_vect 0.0 0.5)))
        (let ((paint_top
                (transform_painter painter1
                                   split_point
                                   (make_vect 1.0 0.5)
                                   (make_vect 0.0 1.0)))
               (paint_bottom
                (transform_painter painter2
                                   (make_vect 0.0 0.0)
                                   (make_vect 1.0 0.0)
                                   split_point))))
            (lambda (frame)
                (paint_top frame)
                (paint_bottom frame))))

(define (below painter1 painter2)
    (rotate270 (beside (rotate90 painter1)
                       (rotate90 painter2))))
