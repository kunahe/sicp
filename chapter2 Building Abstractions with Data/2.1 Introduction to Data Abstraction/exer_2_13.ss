#|
Exercise 2.13: Show that under the assumption of small percentage tolerances there is a simple 
formula for the approximate percentage tolerance of the product of two intervals in terms of the 
tolerances of the factors. You may simplify the problem by assuming that all numbers are positive.
|#

#|
center_percent表示：(a p) (b q)
lower_upper表示： (a-ap a+ap) (b-bq b+bq)

区间乘积lower_upper表示：
x = ((a-ap)(b-bq) (a+ap)(b+bq))
  = (ab(1-p)(1-q) ab(1+p)(1+q))

(width x) = (ab(1+p)(1+q) - ab(1-p)(1-q)) / 2
(center x) = (ab(1+p)(1+q) + ab(1-p)(1-q)) / 2

区间乘积center_percent表示：((center x) (width x) / (center x))
    (width x) / (center x)
=   ((ab(1+p)(1+q) - ab(1-p)(1-q))) / (ab(1+p)(1+q) + ab(1-p)(1-q))
=   ((1+p)(1+q) - (1-p)(1-q)) / ((1+p)(1+q) + (1-p)(1-q))
=   (p+q) / (1+pq)

|#
