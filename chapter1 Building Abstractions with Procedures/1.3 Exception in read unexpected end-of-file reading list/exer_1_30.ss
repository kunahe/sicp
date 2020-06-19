#|
Exercise 1.30: The sum procedure above generates a linear recursion. The procedure can be rewritten
so that the sum is performed iteratively. Show how to do this by filling in the missing expressions
in the following definition:

(define (sum term a next b)
  (define (iter a result)
    (if ????
        ????
        (iter ???? ????)))
  (iter ???? ????))
|#

(define (cube n)
            (* n n n)
)

(define (inc x) 
            (+ x 1)
)

(define (sum term a next b)
            (if (> a b)
                    0
                    (+ (term a) (sum term (next a) next b))
            )
)

(define (sum_iter term a next b)
            (define (iter a result)
                        (if (> a b)
                                result
                                (iter (next a) (+ (term a) result))
                        )
            )
            (iter a 0)
)

(define (sum_cubes a b)
            (sum cube a inc b)
)

(define (sum_cubes_iter a b)
            (sum_iter cube a inc b)
)

(display (sum_cubes 1 10))
(newline)
(display (sum_cubes_iter 1 10))
(exit)

