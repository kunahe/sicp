#|
Exercise 2.19: Consider the change-counting program of 1.2.2. It would be nice to be able to easily
 change the currency used by the program, so that we could compute the number of ways to change a 
 British pound, for example. As the program is written, the knowledge of the currency is 
 distributed partly into the procedure first-denomination and partly into the procedure 
 count-change (which knows that there are five kinds of U.S. coins). It would be nicer to be able 
 to supply a list of coins to be used for making change.

We want to rewrite the procedure cc so that its second argument is a list of the values of the 
coins to use rather than an integer specifying which coins to use. We could then have lists that 
defined each kind of currency:

(define us-coins 
  (list 50 25 10 5 1))

(define uk-coins 
  (list 100 50 20 10 5 2 1 0.5))
We could then call cc as follows:

(cc 100 us-coins)
292
To do this will require changing the program cc somewhat. It will still have the same form, but it 
will access its second argument differently, as follows:

(define (cc amount coin-values)
  (cond ((= amount 0) 
         1)
        ((or (< amount 0) 
             (no-more? coin-values)) 
         0)
        (else
         (+ (cc 
             amount
             (except-first-denomination 
              coin-values))
            (cc 
             (- amount
                (first-denomination 
                 coin-values))
             coin-values)))))
Define the procedures first-denomination, except-first-denomination and no-more? in terms of 
primitive operations on list structures. Does the order of the list coin-values affect the answer 
produced by cc? Why or why not?
|#

(define (old_count_change amount)
    (old_cc amount 5)
)

(define (old_cc amount kinds_of_coins)
    (cond 
        ((= amount 0) 1)
        ((or (< amount 0) (= kinds_of_coins 0)) 0)
        (else 
            (+  (old_cc 
                    amount 
                    (- kinds_of_coins 1))
                (old_cc 
                    (- amount (old_first_denomination kinds_of_coins)) 
                    kinds_of_coins)
            )
        )
    )
)

(define (old_first_denomination kinds_of_coins)
    (cond 
        ((= kinds_of_coins 1) 1)
        ((= kinds_of_coins 2) 5)
        ((= kinds_of_coins 3) 10)
        ((= kinds_of_coins 4) 25)
        ((= kinds_of_coins 5) 50)
    )
)

(define (cc amount coin_values)
    (cond 
        ((= amount 0) 1)
        ((or (< amount 0) (no_more? coin_values)) 0)
        (else 
            (+  (cc 
                    amount
                    (except_first_denomination coin_values))
                (cc 
                    (- amount (first_denomination coin_values))
                    coin_values)
            )
        )
    )
)

(define (except_first_denomination coin_values)
    (cdr coin_values)
)

(define (first_denomination coin_values)
    (car coin_values)
)

(define (no_more? coin_values)
    (null? coin_values)
)

(define us_coins (list 50 25 10 5 1))
(define us_coins_r (list 1 5 10 25 50))
(define uk_coins (list 100 50 20 10 5 2 1 0.5))

(display (cc 100 us_coins))
(newline)
(display (cc 100 uk_coins))
(newline)
(display (cc 100 us_coins_r))
(exit)
