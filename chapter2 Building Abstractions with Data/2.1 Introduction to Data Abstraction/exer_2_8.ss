#|
Exercise 2.8: Using reasoning analogous to Alyssa¡¯s, describe how the difference of two intervals 
may be computed. Define a corresponding subtraction procedure, called sub-interval.
|#

(define (sub_interval a b)
    (make_interval 
        (- (lower_bound a) (upper_bound b))
        (- (upper_bound a) (lower_bound b))
    )
)
