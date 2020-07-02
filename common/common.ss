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

(define (print_rat r)
	(newline)
	(display (numer r))
	(display "/")
	(display (denom r))
)

(define (numer x)
	(car x)
)

(define (denom x)
	(cdr x)
)
