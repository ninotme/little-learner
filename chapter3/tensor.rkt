#lang racket
(require malt)

; (scalar? 8)
; (tlen tensor)
; (ref list pos) 
; (tref tens pos)
; (trefs tens b)

(define t1
  [tensor
    17 12 91 67 ] )

(define t2
  [tensor
   (tensor 3 2 8)
   (tensor 7 1 9)])

(define t3
  (tensor
   (tensor
    (tensor 1 2)
    (tensor 3 4)
    (tensor 14 11))))

   

(define silly-tensor
  [tensor
   (tensor
    (tensor
     (tensor 8)))])

(define super-tensor
  (tensor
   (tensor
    (tensor 8))))

;(tlen t1)
;(tlen t2)
;(tlen silly-tensor)
;(tlen super-tensor)
(tref (tref t2 0) 0)

(define silly-scalar
  (tensor 1))

(format "scalar ~a" (tref silly-scalar 0)) 

(define rank-tensor
  (lambda (t)
    (cond
      ([scalar? t] 0 )
      ( else
        (format "argument: ~a" t)
        (add1 (rank-tensor (tref t 0)))))))

(define unwrap-rank
  (λ (t)
    (unwrap-rank-test t 0)))

(define unwrap-rank-test
  (λ (t a)
    (cond
      ([scalar? t] a)
      (else
       (let ([sub-t (tref t 0)])
         (unwrap-rank-test sub-t (add1 a)))))))

;test the unwrapped rank



(define rank-shape
  (lambda (t)
    (cond
      ([scalar? t] (list))
      (else
       (cons (tlen t)(shape (tref t 0)))))))


(define shape-tco
  (λ (t)
    (shaped-tco t '())))


;; problema: lo shape e` al contrario, controlla la ricorsione

(define shaped-tco
  ( λ (t a)
     (cond
       ([scalar? t] a)
       (else
        (let ([sub-t (tref t 0 )]
              [len-t (tlen t)])
          (shaped-tco sub-t (cons len-t a) )) ))))

(format "Lo shape di t2 is: ~a" (shape-tco t2))

        
(format "tensor shape: ~a" (rank-shape t2))
(format "tensor ~a rank: ~a" t2 (rank-tensor t2))

;
; LAW of accumulator passing 
; 

(define unwrapped-rank
  (lambda (t)
    (rank-helper t 0)))
(define rank-helper
  (lambda (t a)
    (cond
      ([scalar? t] a)
      (else
       (rank-helper (tref t 0) (add1 a))))))

(unwrapped-rank t2)
