#|
Exercise 2.5: Show that we can represent pairs of nonnegative integers using only numbers and 
arithmetic operations if we represent the pair a and b as the integer that is the product 2 a 3 b .
Give the corresponding definitions of the procedures cons, car, and cdr.
|#

(define (exp x y)
    (if (= y 0)
        1
        (* x (exp x (- y 1)))
    )
)

(define (cons a b)
    (* (exp 2 a) (exp 3 b))
)

(define (car z) 
    (if (= (remainder z 2) 0)
        (+ 1 (car (/ z 2)))
        0
    )
)

(define (cdr z) 
    (if (= (remainder z 3) 0)
        (+ 1 (car (/ z 3)))
        0
    )
)

(display (cons 2 3))
(newline)
(display (car (cons 2 3)))
(newline)
(display (cdr (cons 2 3)))
(exit)

