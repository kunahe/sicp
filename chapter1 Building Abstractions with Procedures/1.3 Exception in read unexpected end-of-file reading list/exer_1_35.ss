#|
Exercise 1.35: Show that the golden ratio ¦Õ (1.2.2) is a fixed point of the transformation
x ? 1 + 1 / x , and use this fact to compute ¦Õ by means of the fixed-point procedure.
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (f x)
            (+ 1 (/ 1 x))
)

(define tolerance 0.001)

(define (fixed_point f first_guess)
            (define (close_enough? v1 v2)
                        (< (abs (- v1 v2)) tolerance)
            )
            (define (try guess)
                        (let ((next (f guess)))
                            (if (close_enough? next guess)
                                    guess
                                    (try next)
                            )
                        )
            )
            (try first_guess)
)

(display (fixed_point f 1.0))
(exit)
