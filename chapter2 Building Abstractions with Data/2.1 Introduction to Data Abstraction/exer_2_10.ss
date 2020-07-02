#|
Exercise 2.10: Ben Bitdiddle, an expert systems programmer, looks over Alyssa¡¯s shoulder and 
comments that it is not clear what it means to divide by an interval that spans zero. Modify 
Alyssa¡¯s code to check for this condition and to signal an error if it occurs.
|#

(define (mul_interval x y)
    (let (
        (p1 (* (lower_bound x) (lower_bound y)))
        (p2 (* (upper_bound x) (upper_bound y)))
        (p3 (* (lower_bound x) (upper_bound y)))
        (p4 (* (upper_bound x) (lower_bound y))))
        (make_interval  (min p1 p2 p3 p4)
                        (max p1 p2 p3 p4))
    )
)

(define (div_interval x y)
    (if (or (= (upper_bound y) 0) (= (lower_bound y) 0))
        (error "not allowed")
        (mul_interval 
            x
            (make_interval 
                (/ 1.0 (upper_bound y))
                (/ 1.0 (lower_bound y))))
    )
)
