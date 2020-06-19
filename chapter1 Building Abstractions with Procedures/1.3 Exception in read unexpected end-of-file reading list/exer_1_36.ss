#|
Exercise 1.36: Modify fixed-point so that it prints the sequence of approximations it generates, 
using the newline and display primitives shown in Exercise 1.22. Then find a solution to 
x x = 1000 by finding a fixed point of x ? log ? ( 1000 ) / log ? ( x ) . 
(Use Scheme¡¯s primitive log procedure, which computes natural logarithms.) Compare the number of 
steps this takes with and without average damping. (Note that you cannot start fixed-point with 
a guess of 1, as this would cause division by log ? ( 1 ) = 0 .)
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define tolerance 0.001)

(define (fixed_point f first_guess)
            (define (close_enough? v1 v2)
                        (< (abs (- v1 v2)) tolerance)
            )
            (define (try guess)
                        (newline)
                        (display guess)
                        (let ((next (f guess)))
                            (if (close_enough? next guess)
                                    guess
                                    (try next)
                            )
                        )
            )
            (try first_guess)
)

(define (f x)
            (/ (log 1000) (log x))
)

(fixed_point f 2)
(newline)
(fixed_point (lambda (x) (average x (f x))) 2)
(exit)
