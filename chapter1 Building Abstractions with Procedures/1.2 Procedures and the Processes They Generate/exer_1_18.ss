#|
Exercise 1.18: Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that 
generates an iterative process for multiplying two integers in terms of adding, doubling, and 
halving and uses a logarithmic number of steps.40
|#

(define (even? n)
            (= (remainder n 2) 0))

(define (double n)
            (* n 2))

(define (halve n)
            (/ n 2))

(define (fast_expt_iter a b ret)
            (cond   ((= 0 b) ret)
                    ((even? b) (fast_expt_iter (double a) (halve b) ret))
                    (else (fast_expt_iter a (- b 1) (+ ret a)))
            )
)

(define (fast_expt a b)
            (fast_expt_iter a b 0))

(display (fast_expt 2 8))
(newline)
(display (fast_expt 2 9))
(exit)
