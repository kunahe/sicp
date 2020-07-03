#|
Exercise 2.22: Louis Reasoner tries to rewrite the first square-list procedure of Exercise 2.21 so 
that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
Unfortunately, defining square-list this way produces the answer list in the reverse order of the 
one desired. Why?

Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))
This doesn¡¯t work either. Explain.
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (square_list_1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))


(define (square_list_2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items '()))

(display (square_list_1 (list 1 2 3 4))) ;(1 4 9 16)
(newline)
(display (square_list_2 (list 1 2 3 4))) ;(1 4 9 16)
(newline)
(display (cons '() 1))
(newline)
(display (cons 1 '()))
(newline)
(display (cons (cons 1 2) 3))
(newline)
(display (cons 3 (cons 1 2)))
(exit)
