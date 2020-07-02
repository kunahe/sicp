#|
Exercise 2.2: Consider the problem of representing line segments in a plane. Each segment is 
represented as a pair of points: a starting point and an ending point. Define a constructor 
make-segment and selectors start-segment and end-segment that define the representation of 
segments in terms of points. Furthermore, a point can be represented as a pair of numbers: the x 
coordinate and the y coordinate. Accordingly, specify a constructor make-point and selectors 
x-point and y-point that define this representation. Finally, using your selectors and 
constructors, define a procedure midpoint-segment that takes a line segment as argument and returns
its midpoint (the point whose coordinates are the average of the coordinates of the endpoints). 
To try your procedures, you¡¯ll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
|#

(define (print_point p)
  (newline)
  (display "(")
  (display (x_point p))
  (display ",")
  (display (y_point p))
  (display ")"))


(define (make_segment start end)
    (cons start end)
)

(define (start_segment segment)
    (car segment)
)

(define (end_segment segment)
    (cdr segment)
)

(define (make_point x y)
    (cons x y)
)

(define (x_point point)
    (car point)
)

(define (y_point point)
    (cdr point)
)

(define (midpoint_segment segment)
    (let ((start (start_segment segment))
            (end (end_segment segment)))
            (make_point 
                (/ (+ (x_point start) (x_point end)) 2.0)
                (/ (+ (y_point start) (y_point end)) 2.0)
            )            
        
    )
)

(print_point
    (midpoint_segment 
        (make_segment (make_point 1 1) (make_point 2 4))
    )
)
(exit)
