#|
Exercise 1.8: Newton¡¯s method for cube roots is based on the fact that if y is an approximation to 
the cube root of x , then a better approximation is given by the value
x / y 2 + 2 y 3 .
Use this formula to implement a cube-root procedure analogous to the square-root procedure. 
(In 1.3.4 we will see how to implement Newton¡¯s method in general as an abstraction of these 
square-root and cube-root procedures.)
|#

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
