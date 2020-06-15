#|
Exercise 1.21: Use the smallest-divisor procedure to find the smallest divisor of each of the 
following numbers: 199, 1999, 19999.
|#
(define (square n)
            (* n n))

(define (smallest_divisor n)
            (find_divisor n 2))

(define (find_divisor n test_divisor)
            (cond   ((> (square test_divisor) n) n)
                    ((divides? test_divisor n) test_divisor)
                    (else (find_divisor n (+ test_divisor 1)))
            )
)

(define (divides? a b)
            (= (remainder b a) 0)
)

(display (smallest_divisor 199))
(newline)
(display (smallest_divisor 1999))
(newline)
(display (smallest_divisor 19999))
(newline)
(exit)
