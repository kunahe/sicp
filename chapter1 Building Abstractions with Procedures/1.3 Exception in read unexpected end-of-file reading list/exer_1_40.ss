#|
Exercise 1.40: Define a procedure cubic that can be used together with the newtons-method procedure
in expressions of the form

(newtons-method (cubic a b c) 1)
to approximate zeros of the cubic x 3 + a x 2 + b x + c
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define tolerance 0.0001)
(define dx 0.00001)

(define (cubic a b c)
    (lambda (x) (+ (cube x) (* a (square x)) (* b x) c))
)

(define (newtons_method g guess)
    (fixed_point (newtons_transform g) guess)
)

(define (fixed_point f first_guess)
    (define (close_enough? v1 v2)
        (< (abs(- v1 v2)) tolerance)
    )
    
    (define (try guess)
        (let ((next (f guess)))
            (cond 
                ((close_enough? next guess) next)
                (else (try next))
            )
        )
    )
    (try first_guess)
)

(define (newtons_transform g)
    (lambda (x) 
        (- x (/ (g x) ((deriv g) x)))
    )
)

(define (deriv f)
    (lambda (x)
        (/ 
            (- 
                (f (+ x dx)) 
                (f x)
            )
            dx
        )
    )
)

(display (newtons_method (cubic 3 2 1) 1.0))
(exit)
