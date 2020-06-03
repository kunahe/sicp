; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of 
; the squares of the two larger numbers.

(define (min x y) 
    (cond   ((> x y) y)
            ((= x y) x)
            (else x)))

(define (min3 x y z)
    (cond   ((< (min x y) z) (min x y))
            (else z)))


(define (sum_max_2 x y z)
    (- (+ x y z) (min3 x y z)))

(display (sum_max_2 -1 -3 -3))
(exit)
