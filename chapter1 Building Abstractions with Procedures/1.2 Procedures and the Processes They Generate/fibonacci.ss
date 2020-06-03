(define (fib1 n)
            (cond   ((= n 0) 0)
                    ((= n 1) 1)
                    (else (+    (fib1 (- n 1)) 
                                (fib1 (- n 2))))))

(define (fib2 n)
            (fib_iter 1 0 n))

(define (fib_iter a b n)
            (if     (= n 0)
                    b
                    (fib_iter (+ a b) a (- n 1))))


(display (fib1 7))
(newline)
(display (fib2 7))
(exit)
