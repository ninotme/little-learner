#lang racket/base



(define min-ora
  (lambda (x)
    (/ x 60.0)))

(define ora-min
  (lambda (x)
    (* x 60.0)))


(define helper
  (lambda (x)
    (define h (min-ora (- x 120)))
    (* (floor h) 2)))







(define costo-sosta-due
  (lambda (x)
    (if (< x (* 24 60))
    (let ([res 0]
          [piena-fascia-due 2]
          [piena-fascia-tre 6])
      (min 16
           (cond 
        [(<= x 30) 0]
        [(<= x 120) 2]
        [(<= x (* 6 60))
         (+ piena-fascia-due (helper x))]
        (else 16))))
    (displayln "hey!"))))

(define sosta (+ 120 (* 70 60)))
(define sosta1 (ora-min 15))
(let ([res (costo-sosta-due sosta1)])
  (format "il costo della sosta di ~a min (~a ore) ore e: ~a EUR" sosta1 (min-ora sosta1) res ))
