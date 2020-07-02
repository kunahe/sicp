

(define (myforce delayed_object)
    (display "delayed_object: ")
    (display delayed_object)
    (newline)
    (delayed_object)
)

(define (test x y)
    (begin 
        (display "test ")
        (display x)
        (display y)
        (newline)
    )
)

(define (memo_proc proc)
    (let ((already_run? #f) (result #f))
        (test 0 result)
        (lambda ()
            (if (not already_run?)
                (begin (set! result (proc))
                    (set! already_run? #t)
                    (test 1 result)
                    result)
                (begin
                    (test 2 result)
                    result)
            )
        )
    )
)

(define (mydelay expression)
    (memo_proc (lambda () expression))
)

(define (cons_stream a b)
    (cons a (mydelay b))
)

(define (stream_car stream)
    (car stream)
)

(define (stream_cdr stream)
    (myforce (cdr stream))
)

(define x (cons_stream 'a (cons_stream 'b '())))

(define y (stream_cdr x))

(stream_cdr x)
(exit)
