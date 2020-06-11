#|
Exercise 1.11: A function f is defined by the rule that 
f ( n ) = n if n < 3 and 
f ( n ) = f ( n ? 1 ) + 2 f ( n ? 2 ) + 3 f ( n ? 3 ) if n ¡Ý 3 . 
Write a procedure that computes f by means of a recursive process. Write a procedure that 
computes f by means of an iterative process.
|#

(define (f_recursive n)
            (if (< n 3)
                n
                (+  (f_recursive (- n 1)) 
                    (* 2 (f_recursive (- n 2))) 
                    (* 3 (f_recursive (- n 3))))))


(define (f_iter n)
            (if (< n 3)
                n
                (iter 0 1 2 n)))

(define (iter a b c n)
            (if (= n 3)
                (+ (* 3 a) (* 2 b) c)
                (iter   b 
                        c
                        (+ (* 3 a) (* 2 b) c)
                        (- n 1))))

(display (f_recursive 12))
(newline)
(display (f_iter 12))
(exit)
