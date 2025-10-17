#lang racket
(require malt)

; dataset
(define line-xs
  (tensor 2.0 1.0 4.0 3.0))
(define line-ys
  (tensor 1.8 1.2 4.2 3.3))



; hyperparams definition 
(define revs 1000)
(define alpha 0.01)



; gradient descent functino
(define my-gradient-descent
  (λ(obj theta)
    (let ([f (λ (big-theta)
                (map (λ(p g)
                        (- p (* alpha g)))
                     big-theta
                     (gradient-of obj big-theta)))])
      (revise f revs theta))))

(my-gradient-descent
 ((l2-loss line) line-xs line-ys) (list 0.0 0.0))



(define (new-line x theta)
  (+ (* (first theta) x ) (second theta)))

(define super-line
  (λ(x)
    (λ(theta)
      (+ (* (first theta) x) (second theta)))))


(define my-shape
  (λ(t)
    (cond
      ([scalar? t] (list))
      (else
        (cons (tlen t) (my-shape (tref t 0)))))))

(my-shape
 ( tensor
   (tensor
    (tensor 1 2)
    (tensor 2 3))))

[ [ [ 1 2] [2 3 ] ] ] 

;(define my-line (newline line-xs))
