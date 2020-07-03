#|
Exercise 2.21: The procedure square-list takes a list of numbers as argument and returns a list of 
the squares of those numbers.

(square-list (list 1 2 3 4))
(1 4 9 16)
Here are two different definitions of square-list. Complete both of them by filling in the missing 
expressions:

(define (square-list items)
  (if (null? items)
      nil
      (cons ???? ????)))

(define (square-list items)
  (map ???? ????))
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (square_list_1 items)
  (if (null? items)
      '()
      (cons 
        (square (car items)) 
        (square_list_1 (cdr items)))))

(define (square_list_2 items)
  (map square items))

(display (square_list_1 (list 1 2 3 4))) ;(1 4 9 16)
(newline)
(display (square_list_2 (list 1 2 3 4))) ;(1 4 9 16)
(exit)
