#lang racket/base

(require fancy-app
         racket/contract
         racket/match
         "base.rkt")

(module+ test
  (require rackunit))

(provide
 (contract-out
  [posn-add (-> posn? posn? posn?)]
  [posn-subtract (-> posn? posn? posn?)]
  [posn-negate (-> posn? posn?)]
  [posn-sum (-> (listof posn?) posn?)]))


(define/match (posn-add posn1 posn2)
  [((posn x1 y1) (posn x2 y2))
   (posn (+ x1 x2) (+ y1 y2))])

(module+ test
  (check-equal? (posn-add (posn 1 2) (posn 4 6))
                (posn 5 8)))


(define/match (posn-subtract posn1 posn2)
  [((posn x1 y1) (posn x2 y2))
   (posn (- x1 x2) (- y1 y2))])

(module+ test
  (check-equal? (posn-subtract (posn 1 2) (posn 4 6))
                (posn -3 -4)))


(define/match (posn-negate a-posn)
  [((posn x y))
   (posn (- x) (- y))])

(module+ test
  (check-equal? (posn-negate (posn 3 -2)) (posn -3 2)))


(define posn-sum
  (foldl posn-add origin _))

(module+ test
  (check-equal? (posn-sum (list (posn 1 1) (posn 2 2) (posn 4 3)))
                (posn 7 6)))
