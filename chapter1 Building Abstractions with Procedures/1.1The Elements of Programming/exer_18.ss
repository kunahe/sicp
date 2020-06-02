(define (square x)
            (* x x))

(define (abs x)
            (if (< x 0) (- x)
                x))

(define (improve guess x)
            (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good_enough old_guess guess)
            (< (/ (abs (- old_guess guess)) old_guess) 0.0001))

(define (cube_root_iter guess x)
            (if (good_enough guess (improve guess x))
                guess
                (cube_root_iter (improve guess x) x)))

(define (cube_root x)
            (cube_root_iter 1.0 x))


(display (cube_root  27))
(exit)
