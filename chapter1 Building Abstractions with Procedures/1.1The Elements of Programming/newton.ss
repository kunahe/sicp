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
            (if (good_enough guess x) 
                guess
                (sqrt_iter (improve guess x) x)))

(define (sqrt x)
            (sqrt_iter 1.0 x))

(display (sqrt  2))
(newline)
(display (sqrt  0.00009))
(newline)
(display (sqrt  900000000000000000000000000000000000000000000000000000000000000000000000000000000000))
(exit)
