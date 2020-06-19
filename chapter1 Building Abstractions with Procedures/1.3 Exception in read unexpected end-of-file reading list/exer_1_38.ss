#|
Exercise 1.38: In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus 
Continuis, which included a continued fraction expansion for e ? 2 , where e is the base of the 
natural logarithms. In this fraction, the N i are all 1, and the D i are successively 
1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ¡­. 
Write a program that uses your cont-frac procedure from Exercise 1.37 to approximate e , based on 
Euler¡¯s expansion.
|#

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

(define (d i)
    (cond                
        ((= (remainder i 3) 0) 1)
        ((= (remainder i 3) 1) 1)
        (else (* 2 (/ (+ i 1) 3)))
    )
)

(define (evaluate_e k)
    (+ 2 (cont_frac (lambda (i) 1.0) d k))
)

(display (evaluate_e 1000))
(exit)
