#|
Exercise 1.12: The following pattern of numbers is called Pascal¡¯s triangle.

         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
       . . .
The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum 
of the two numbers above it.35 Write a procedure that computes elements of Pascal¡¯s triangle by 
means of a recursive process.
|#

(define (get_sn level)
        (/ (* level (+ level 1)) 2))

(define (get_level level n)
            (if (or (< n (get_sn level)) (= n (get_sn level)))
                level
                (get_level (+ level 1) n)
                ))

(define (is_edge level n)
            (if (or (= n (get_sn level)) 
                    (= n (+ (- (get_sn level) level) 1))
                )
                #t
                #f))

(define (get_value level n)
            ;(printf "~d\n" (is_edge (get_level 1 n) n))
            (cond 
                ((is_edge level n)  1)
                
                (else (+  (get_value (- level 1) (- n level)) 
                    (get_value (- level 1) (+ 1 (- n level))))
				)
            )
)

(define (run n)
			(get_value (get_level 1 n) n))

(display (run 1))
(newline)
(display (run 2))
(newline)
(display (run 3))
(newline)
(display (run 4))
(newline)
(display (run 5))
(newline)
(display (run 6))
(newline)
(display (run 7))
(newline)
(display (run 8))
(newline)
(display (run 9))
(newline)
(display (run 10))
(newline)
(display (run 11))
(newline)
(display (run 12))
(newline)
(display (run 13))
(newline)
(display (run 14))
(newline)
(display (run 15))
(newline)
(display (run 16))
(newline)
(display (run 17))
(newline)
(display (run 18))
(newline)
(display (run 19))
(newline)
(display (run 20))
(newline)
(display (run 21))
(newline)

(exit)
