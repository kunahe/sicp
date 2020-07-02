#|
Exercise 2.11: In passing, Ben also cryptically comments: ¡°By testing the signs of the endpoints 
of the intervals, it is possible to break mul-interval into nine cases, only one of which requires 
more than two multiplications.¡± Rewrite this procedure using Ben¡¯s suggestion.
|#

(define (mul_interval x y)
    (let 
        ((a (lower_bound x))
         (b (upper_bound x))
         (c (lower_bound y))
         (d (upper_bound y)))
        (if (> a 0)
            (if (> c 0)
                (make_interval (* a c) (* b d))
                (if (> d 0)
                    (make_interval (* c b) (* b d))
                    (make_interval (* c b) (* a d))
                )
            )
            (if (> b 0)
                (if (> c 0)
                    (make_interval (* a d) (* b d))
                    (if (> d 0)
                        (make_interval (* a d) (max (* b d) (* a c)))
                        (make_interval (* b c) (* a c))
                    )
                )
                (if (> c 0)
                    (make_interval (* a d) (* b c))
                    (if (> d 0)
                        (make_interval (* a d) (* a c))
                        (make_interval (* b d) (* a c))
                    )
                )
            )
        )
    )
)
