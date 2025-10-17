#lang racket
(require malt)

(provide line-xs line-ys)

; dataset
(define line-xs
  (tensor 2.0 1.0 4.0 3.0))
(define line-ys
  (tensor 1.8 1.2 4.2 3.3))

(printf "~a" line-xs)