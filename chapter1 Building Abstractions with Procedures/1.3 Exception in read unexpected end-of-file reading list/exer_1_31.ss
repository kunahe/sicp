#|
Exercise 1.31:

The sum procedure is only the simplest of a vast number of similar abstractions that can be 
captured as higher-order procedures.51 Write an analogous procedure called product that returns 
the product of the values of a function at points over a given range. Show how to define factorial 
in terms of product. Also use product to compute approximations to ¦Ð using the formula52
¦Ð 4 = 2 ? 4 ? 4 ? 6 ? 6 ? 8 ? ? 3 ? 3 ? 5 ? 5 ? 7 ? 7 ? ? .
If your product procedure generates a recursive process, write one that generates an iterative 
process. If it generates an iterative process, write one that generates a recursive process.
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (product term a next b)
            (if (> a b)
                    1
                    (* (term a) (product term (next a) next b))
            )
)

(define (product_iter term a next b)
            (define (iter a result)
                        (if (> a b)
                                result
                                (iter (next a) (* (term a) result))
                        )
            )
            (iter a 1)
)

(define (inc n)
            (+ n 1)
)

(define (factorial n)
            (define (identity x) x)
            (product identity 1 inc n)
)

(define (factorial_iter n)
            (define (identity x) x)
            (product_iter identity 1 inc n)
)

(display (factorial 5))
(newline)
(display (factorial_iter 5))
(newline)

(define (evaluate_pi n)            
            (define (next x) (+ x 1))
            (define (numer_term x)
                        (cond 
                                ((= x 1) 2)
                                ((even? x) (+ x 2))
                                (else (+ x 1))
                        )                        
            )
            (define (denom_term x)
                        (cond                                 
                                ((even? x) (+ x 1))
                                (else (+ x 2))
                        )                        
            )

            (* 4.0 (/ (product numer_term 1.0 next n) (product denom_term 1.0 next n)))
            
)

(display (evaluate_pi 100))

(exit)
