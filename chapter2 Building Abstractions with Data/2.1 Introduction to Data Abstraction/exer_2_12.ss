#|
Exercise 2.12: Define a constructor make-center-percent that takes a center and a percentage 
tolerance and produces the desired interval. You must also define a selector percent that produces 
the percentage tolerance for a given interval. The center selector is the same as the one shown 
above.
|#

(define (make_center_percent c p)
    (make_interval 
        (- c (* c p)) 
        (+ c (* c p)))
)

(define (center i)
    (/ (+ (lower_bound i) (upper_bound i)) 2)
)

(define (width i)
    (/ (- (upper_bound i) (lower_bound i)) 2)
)

(define (percent i)
    (* 100 (/ (width i) (center i)))
)
