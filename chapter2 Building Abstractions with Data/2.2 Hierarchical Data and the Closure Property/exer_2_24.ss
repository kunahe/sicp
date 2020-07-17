#|
Exercise 2.24: Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the result 
printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of 
this as a tree (as in Figure 2.6).
|#

(display 
    (list 1 (list 2 (list 3 4)))
)

(exit)

#|
 (1 (2 (3 4)))       ((2 (3 4)))
[*]---------------> [*]
 |                   |
 |                   |
 v                   v (2 (3 4))         ((3 4))
 1                  [*]---------------> [*]
                     |                   |
                     |                   |
                     v                   v (3 4)             (4)
                     2                  [*]---------------> [*]---------------> '()
                                         |                   |
                                         |                   |
                                         v                   v
                                         3                   4

 (1 (2 (3 4)))
   *
  / \
 /   \  (2 (3 4))
1     *
     / \
    /   \  (3 4)
   2     *
        / \
       /   \
      3     4                                         
|#

