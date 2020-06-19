#|
Exercise 1.39: A continued fraction representation of the tangent function was published in 1770 
by the German mathematician J.H. Lambert:
tan ? x = x 1 ? x 2 3 ? x 2 5 ? ¡­ ,
where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the 
tangent function based on Lambert¡¯s formula. k specifies the number of terms to compute, as in 
Exercise 1.37.
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (cont_frac n d k)
    (define (f x)
        (cond 
            ((= x k) (/ (n x) (d x)))
            (else 
                (/ (n x) (+ (d x) (f (+ x 1))))
            )
        )
    )
    (f 1)
)

(define (tan_cf x k)
    (define (n i)
        (cond 
            ((= i 1) x)
            (else (- (square x)))
        )
    )

    (define (d i)
        (- (* 2 i) 1)
    )

    (exact->inexact (cont_frac n d k))
)

(display (tan_cf 10 100))
(exit)
