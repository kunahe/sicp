#|
Exercise 2.18: Define a procedure reverse that takes a list as argument and returns a list of the 
same elements in reverse order:

(reverse (list 1 4 9 16 25))
(25 16 9 4 1)
|#

(define (reverse l)
    (if (null? (cdr l))
        l
        (append (reverse (cdr l)) (cons (car l) '()))
    )
)

(display (reverse (list 1 4 9 16 25)))
;(display (append (append (list 1 2) 3) 4))
(exit)
