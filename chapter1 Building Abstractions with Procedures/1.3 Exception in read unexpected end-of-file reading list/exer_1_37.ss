#|
Exercise 1.37:

An infinite continued fraction is an expression of the form
f = N 1 D 1 + N 2 D 2 + N 3 D 3 + ¡­ .
As an example, one can show that the infinite continued fraction expansion with the N i and the D i
all equal to 1 produces 1 / ¦Õ , where ¦Õ is the golden ratio (described in 1.2.2). One way to 
approximate an infinite continued fraction is to truncate the expansion after a given number of 
terms. Such a truncation¡ªa so-called finite continued fraction k-term finite continued fraction¡ªhas
the form

N 1 D 1 + N 2 ? + N k D k .

Suppose that n and d are procedures of one argument (the term index i ) that return the N i and D i
of the terms of the continued fraction. Define a procedure cont-frac such that evaluating 
(cont-frac n d k) computes the value of the k -term finite continued fraction. Check your procedure
by approximating 1 / ¦Õ using

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

for successive values of k. How large must you make k in order to get an approximation that is 
accurate to 4 decimal places?

If your cont-frac procedure generates a recursive process, write one that generates an iterative 
process. If it generates an iterative process, write one that generates a recursive process.
|#

(define (cont_frac n d k)
    (define (f x)
        (cond 
            ((= x k) (/ (n x) (d x)))
            (else 
                (/ (n x) (+ (d x) (f (+ x 1))))
            )
        )
    )
    (f 1)
)

(display (cont_frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
)
(newline)

(define (cont_frac_iter n d k)
    (define (iter x result)
        (cond 
            ((= x k) 
                (iter 
                    (- x 1) 
                    (/ (n x) (d x))
                )
            )
            ((= x 0)
                result
            )
            (else 
                (iter 
                    (- x 1) 
                    (/ (n x) (+ (d x) result))
                )
            )
        )
    )
    (iter k 0)
)

(display (cont_frac_iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
)
(exit)

