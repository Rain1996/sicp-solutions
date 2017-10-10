(define (stream_map proc . argstreams)
    (if (null? (car argstreams))
        the_empty_stream
        (begin (apply proc (map stream_car argstreams))
               (apply proc (map stream_cdr argstreams)))))
