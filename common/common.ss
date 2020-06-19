(define (even? n)
            (= (remainder n 2) 0)
)

(define (odd? n)
            (not (even? n))
)

(define (square n)
            (* n n)
)

(define (cube n)
            (* n n n)
)

(define (inc n)
            (+ n 1)
)

(define (identity x) x)

(define (abs x)
            (cond 
                    ((> x 0) x)
                    ((< x 0) (- x))
                    ((= x 0) x)
            )
)

(define (average a b)
            (/ (+ a b) 2)
)
