#lang racket
(require malt)

(provide l2-loss)

(define loss
  (λ (obs line-x theta)
    (let ([pred ((line line-x) theta)])
      (sum
       (sqr (- obs pred))))))



(define line-l2-loss
  (λ (xs ys)
    (λ (theta)
      (let ( [pred-ys ((line xs) theta) ])
        (sum
         (sqr
          (- ys pred-ys)))))))

; generalized l2-loss
(define ll2-loss
  (λ (target)
    (λ (ys xs)
      (λ (theta)
        (let ( [pred-ys ((target xs) theta)])
          (sum
           (sqr
            (- ys pred-ys))))))))


(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))

(define real-loss ((ll2-loss line) line-xs line-ys))

(real-loss '(0.627 0.0))

