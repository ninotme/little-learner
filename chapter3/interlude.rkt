#lang racket
(require malt)
(require "my-line.rkt")

; sum-1 of tensor

(define sum-1
  (lambda (t)
    (summed t (sub1 (tlen t) ) 0.0)))

(define summed
  (lambda (t i a)
    (cond
      ([zero? i] (+ a  (tref t 0)))
      (else
       (summed t (sub1 i) (+ a (tref t i)))))))

(define t1
  [tensor 1 2 3 4 10 ])
(sum-1 t1)



