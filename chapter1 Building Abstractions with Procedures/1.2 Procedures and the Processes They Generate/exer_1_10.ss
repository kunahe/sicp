#|
Exercise 1.10: The following procedure computes a mathematical function called Ackermann¡¯s function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
What are the values of the following expressions?

(A 1 10)
(A 2 4)
(A 3 3)
Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
Give concise mathematical definitions for the functions computed by the procedures f, g, 
and h for positive integer values of n . For example, (k n) computes 5 n 2 .
|#

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
#|
f(x, y) =   0                           (y = 0)
            2 * y                       (x = 0, y != 0)
            2                           (x != 0, y = 1)
            f(x - 1, f(x, y - 1))       (else)

f(1, 10)    = f(0, f(1, 9)) = 2 * f(1, 9)  = 2 * f(0, f(1, 8)) = 2 * 2 * f(1, 8) = 2^2 * f(0, f(1, 7)) 
            = 2^3 * f(1, 7) = 2^3 * f(0, f(1, 6)) = 2^4 * f(1, 6) = 2^4 * f(0, f(1, 5)) = 2^5 * f(1, 5)
            = 2^5 * f(0, f(1, 4)) = 2^6 * f(1, 4) = 2^6 * f(0, f(1, 3)) = 2^7 * f(1, 3) = 2^7 * f(0, f(1, 2))
            = 2^8 * f(1, 2) = 2^8 * f(0, f(1, 1)) = 2^9 * f(1, 1) = 2^10 = 1024

f(2, 4)     = f(1, f(2, 3)) = f(1, f(1, f(2, 2))) = f(1, f(1, f(1, f(2, 1)))) = f(1, f(1, f(1, 2)))
            = f(1, f(1, f(0, f(1, 1)))) = f(1, f(1, f(0, 2))) = f(1, f(1, 4)) = f(1, f(0, f(1, 3)))
            = f(1, f(0, f(0, f(1, 2)))) = f(1, f(0, f(0, f(0, f(1, 1))))) = f(1, f(0, f(0, f(0, 2))))
            = f(1, f(0, f(0, 4))) = f(1, f(0, 8)) = f(1, 16) = 2 * f(1, 15) = 2^15 * f(1, 1) = 2^16 = 65536

            f(1, n) = 2 ^ n;
            f(2, n) = 2 ^ f(2, n-1) = 2 ^ ¡­¡­ ^ 2 = 2 ^ (n-1)¸ö2

f(3, 3)     = f(2, f(3, 2)) = f(2, f(2, f(3, 1))) = f(2, f(2, 2)) = f(2, 2 ^ 2) = f(2, 4) = 2^16
|#
(display (A 1 10))
(newline)
(display (A 2 4))
(newline)
(display (A 3 3))
(exit)
