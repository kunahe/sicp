(define (max x y)
    (cond   ((> x y) x)            
            (else y)))

(define (square x) (* x x))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (f x y z)
    (cond   ((> (max x y) z)
                ;max num is in x, y
                (cond   ((> x y) (sum_of_squares x (max y z))) 
                        (else   (sum_of_squares y (max x z)))))
            (else 
                ;z is max
                (sum_of_squares z (max x y)))))

(display (f -1 -2 -3))
(exit)

