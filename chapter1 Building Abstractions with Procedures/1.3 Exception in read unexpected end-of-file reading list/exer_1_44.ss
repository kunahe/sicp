#|
Exercise 1.44: The idea of smoothing a function is an important concept in signal processing. 
If f is a function and d x is some small number, then the smoothed version of f is the function 
whose value at a point x is the average of f ( x ? d x ) , f ( x ) , and f ( x + d x ) . 
Write a procedure smooth that takes as input a procedure that computes f and returns a procedure 
that computes the smoothed f . It is sometimes valuable to repeatedly smooth a function 
(that is, smooth the smoothed function, and so on) to obtain the n-fold smoothed function. Show 
how to generate the n-fold smoothed function of any given function using smooth and repeated from 
Exercise 1.43.
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (repeated f n)
    (cond 
        ((= n 1) f)
        (else 
            (lambda (x) 
                (f 
                    ((repeated f (- n 1)) x)
                )
            )
        )
    )
)

(define (smooth f)
    (lambda (x) 
        (/ 
            (+ 
                (f (- x dx)) 
                (f x) 
                (f (+ x dx))
            ) 
            3
        )
    )
)

;((repeated (smooth) n) f)
