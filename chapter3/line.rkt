#lang racket

(provide line)


(define line
  (lambda (x)
    (lambda (tetha)
      (let ([m (list-ref tetha 0)]
            [b (list-ref tetha 1)])
        (+ b (* m x))))))

