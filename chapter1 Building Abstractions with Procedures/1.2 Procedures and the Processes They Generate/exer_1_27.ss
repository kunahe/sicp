#|
Demonstrate that the Carmichael numbers listed in Footnote 47 really do fool the Fermat test. 
That is, write a procedure that takes an integer n and tests whether a n is congruent to a modulo 
n for every a < n , and try your procedure on the given Carmichael numbers.
|#

(define (even? n)
            (= (remainder n 2) 0)
)

(define (square n)
            (* n n)
)

(define (expmod base exp m)
            (cond   ((= exp 0) 1)
                    (
                        (even? exp) 
                            (remainder (square (expmod base (/ exp 2) m)) m)
                    )
                    (
                        else 
                            (remainder (* base (expmod base (- exp 1) m)) m)
                    )
            )
)

(define (fermat_test n times)
            (define (try_it a)
                        (= (expmod a n n) a)
            )
        (try_it times)        
)

(define (fast_prime? n times)
            (cond   ((= times n) #t)
                    ((fermat_test n times) (fast_prime? n (+ times 1)))
                    (else #f)
            )
)

(define (test_carmichael n)
            (cond
                ((fast_prime? n 1) (display "true"))
                (else (display "false"))
            )
)

(test_carmichael 561)
(newline)
(test_carmichael 1105)
(newline)
(test_carmichael 1729)
(newline)
(test_carmichael 2465)
(newline)
(test_carmichael 2821)
(newline)
(test_carmichael 6601)
(newline)
(exit)
