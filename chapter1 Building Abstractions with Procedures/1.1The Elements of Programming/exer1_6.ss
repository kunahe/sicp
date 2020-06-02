(define (new_if predicate then_clause else_clause)
            (cond   (predicate then_clause)
                    (else else_clause)))

(define (square x)
            (* x x))

(define (abs x) 
            (if (< x 0) (- x) x))

(define (average x y)
            (/ (+ x y) 2))

(define (good_enough guess x)
            (< (abs (- (square guess) x)) 0.0001))            

(define (improve guess x)
            (average guess (/ x guess)))

(define (sqrt_iter guess x) 
            (new_if (good_enough guess x) 
                    guess
                    (sqrt_iter (improve guess x) x)))

(define (sqrt x)
            (sqrt_iter 1.0 x))

(display (sqrt  2))
(exit)
