#lang racket

; first attempt at a line

(define silly-line
  (lambda (x)
    (lambda (w b)
      (let ( [y (+ (* w x) b)] )
        y))))


(define silly-line-two
  (lambda (x)
    (lambda (w b)
     (+ b (* w x)))))

; parametrized functions
; the funciton takes additional paramenters [w b] after taking formal [x]

((silly-line-two 8) 4 6)


; dataset definition

;(define line-xs [2.0 1.0 4.0 3.0])
;(define line-ys [1.8 1.2 4.2 3.3])



(define my-line
  (lambda (x)
    (lambda (theta)
      (let ([theta-0 (list-ref theta 0)]
            [theta-1 (list-ref theta 1)]) 
      (+ theta-1) (* theta-0 x)))))

((my-line 8) '(4 6))