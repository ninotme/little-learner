#lang racket
(require malt)


(define line-xs
  (tensor 2.0 1.0 4.0 3.0))
(define line-ys
  (tensor 1.8 1.2 4.2 3.3))

(define objective ((l2-loss line) line-xs line-ys))


(objective '(1.009 0.1))


(gradient-of ( λ(theta)
                (sqr (ref theta 0)))
             (list 27.0))

(gradient-of objective (list 0.0 0.0))