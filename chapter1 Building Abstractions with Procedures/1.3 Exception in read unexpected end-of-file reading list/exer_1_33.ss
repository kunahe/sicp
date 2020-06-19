#|
Exercise 1.33: You can obtain an even more general version of accumulate (Exercise 1.32) by 
introducing the notion of a filter on the terms to be combined. That is, combine only those terms 
derived from values in the range that satisfy a specified condition. The resulting 
filtered-accumulate abstraction takes the same arguments as accumulate, together with an 
additional predicate of one argument that specifies the filter. Write filtered-accumulate as a 
procedure. Show how to express the following using filtered-accumulate:

the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime?
predicate already written)
the product of all the positive integers less than n that are relatively prime to n 
(i.e., all positive integers i < n such that GCD ( i , n ) = 1 ).
|#

(load "C:\\workdir\\scheme\\sicp\\common\\common.ss")

(define (filtered_accumulate combiner null_value predicate term a next b)
            (cond 
                    ((> a b) null_value)
                    ((predicate a) 
                        (combiner (term a) (filtered_accumulate combiner null_value predicate term (next a) next b))
                    )
                    (else (filtered_accumulate combiner null_value predicate term (next a) next b))
            )
)

(define (prime? n)
            (if (= n 1) 
                #f
                (= (smallest_divisor n 2) n)
            )
)

(define (smallest_divisor n a)
            (cond 
                    ((> (square a) n) n)
                    ((divides n a) a)
                    (else (smallest_divisor n (+ a 1)))
            )
)

(define (divides a b)
            (= (remainder a b) 0)
)

(display (filtered_accumulate + 0 prime? identity 1 inc 10))
(exit)
