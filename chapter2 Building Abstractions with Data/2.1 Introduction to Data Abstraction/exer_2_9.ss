#|
Exercise 2.9: The width of an interval is half of the difference between its upper and lower 
bounds. The width is a measure of the uncertainty of the number specified by the interval. 
For some arithmetic operations the width of the result of combining two intervals is a function 
only of the widths of the argument intervals, whereas for others the width of the combination is 
not a function of the widths of the argument intervals. Show that the width of the sum (or 
difference) of two intervals is a function only of the widths of the intervals being added (or 
subtracted). Give examples to show that this is not true for multiplication or division.
|#

(define (make_interval a b) (cons a b))

(define (upper_bound x)
    (car x)
)

(define (lower_bound x)
    (cdr x)
)

(define (sub_interval a b)
    (make_interval 
        (- (lower_bound a) (upper_bound b))
        (- (upper_bound a) (lower_bound b))
    )
)

(define (add_interval a b)
    (make_interval
        (+ (lower_bound a) (upper_bound b))
        (+ (upper_bound a) (lower_bound b))
    )
)

(define (width_of_interval x)
    (/ (- (upper_bound x) (lower_bound x)) 2)
)

#|
x = (a, b)
y = (c, d)
width(x) = (b - a) / 2
width(y) = (d - c) / 2

width(x + y) = ((b + d) - (a + c)) / 2
             =  (b - a) / 2 + (d - c) / 2
             = width(x) + width(y)
|#

