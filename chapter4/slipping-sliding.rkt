#lang racket
(require malt)

(define line-xs
  (tensor 2.0 1.0 4.0 3.0))
(define line-ys
  (tensor 1.8 1.2 4.2 3.3))

(define obj
  ((l2-loss line) line-xs line-ys))

(define get-loss-line
  (λ (w)
    (cond
      ([empty? w] w)
      (else
       (let ([args (list (first w) 0.0)])
         (cons (obj args) (get-loss-line (rest w))))))))


; get the loss form some parameter tries
 (get-loss-line '(-1.0 0.0  2.0  3.0))

(define my-revise
  (λ (f revs theta)
    (cond
      ([zero? revs] theta)
      (else
       (my-revise f (sub1 revs) (f theta))))))

;(define update-rule
;  (λ (theta gradient alpha)
;    (

(define new-map
  (λ (theta)
    (map (λ (p)
           (- p 3))
         theta)))

;(new-map (list 1 2 3))

;(my-revise new-map 5 (list 1 2 3))

;; try revise

(let ([alpha 0.01]
      [obj ((l2-loss line) line-xs line-ys)])
  (let ([f (λ (theta)
             (let ([gs (gradient-of obj theta )])
               (map (λ (p g)
                      (- p (* alpha g)))
                    theta
                    gs)))])
    (my-revise f 1000 (list 0.0 0.0))))



(let ([alpha 0.01]
      [obj ((l2-loss line) line-xs line-ys)])
  (let ([f (λ (theta)
             (map (λ (p g)
                    (- p (* alpha g)))
                  theta
                  (gradient-of obj theta)))])
    (my-revise f 1000 (list 0.0 0.0))))

  
           




