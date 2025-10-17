#lang typed/racket

(: fib (Integer -> Integer))
(define (fib n)
  (let: loop ([a : Integer 0]
              [b : Integer 1]
              [i : Integer 0])
    (if (= i n)
        a
        (loop b (+ a b) (add1 i)))))

(require racket/base)
(define start (current-inexact-milliseconds))
(fib 5000000)
(printf "Time: ~a ms\n" (- (current-inexact-milliseconds) start))
