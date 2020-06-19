#|
Exercise 1.29: Simpson¡¯s Rule is a more accurate method of numerical integration than the method 
illustrated above. Using Simpson¡¯s Rule, the integral of a function f between a and b is 
approximated as

h 3 ( y 0 + 4 y 1 + 2 y 2 + 4 y 3 + 2 y 4 + ? + 2 y n ? 2 + 4 y n ? 1 + y n ) ,
where h = ( b ? a ) / n , for some even integer n , and y k = f ( a + k h ) . 
(Increasing n increases the accuracy of the approximation.) 
Define a procedure that takes as arguments f , a , b , and n and returns the value of the integral,
computed using Simpson¡¯s Rule. Use your procedure to integrate cube between 0 and 1 
(with n = 100 and n = 1000 ), and compare the results to those of the integral procedure shown 
above.
|#

(define (sum term a next b)
            (if (> a b)
                    0
                    (+ (term a) (sum term (next a) next b))
            )
)

(define (even? n)
            (= (remainder n 2) 0)
)

(define (cube n)
            (* n n n)
)

(define (integral f a b dx)
            (define (add_dx x)
                        (+ x dx)
            )
            (* (sum f (+ a (/ dx 2.0)) add_dx b) dx)
)

(define (simpson f a b n)
            (define h 
                    (/ (- b a) n)
            )
            (define (y k)
                        (f (+ a (* k h)))
            )
            (define (factor k)
                        (cond 
                                ((or (= k 0) (= k n)) 1)
                                ((not (even? k)) 4)
                                (else 2)
                        )
            )
            (define (term k)
                        (* (factor k) (y k))
            )
            (define (next k)
                        (+ k 1)
            )
            (if (not (even? n)) 
                    (error "n is odd")
                    (* (/ h 3.0) (sum term 0 next n))
            )
)

(display (integral cube 0 1 0.001))
(newline)
(display (simpson cube 0 1 100))
(newline)
(display (simpson cube 0 1 1000))
(exit)
