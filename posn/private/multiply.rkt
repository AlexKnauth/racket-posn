#lang racket/base

(require fancy-app
         racket/contract
         racket/match
         "base.rkt")

(module+ test
  (require rackunit))

(provide
 (contract-out
  [posn-multiply (-> posn? posn? posn?)]
  [posn-divide (-> posn? posn? posn?)]
  [posn-product (-> (listof posn?) posn?)]))


(define/match (posn-multiply posn1 posn2)
  [((posn x1 y1) (posn x2 y2))
   (posn (* x1 x2) (* y1 y2))])

(module+ test
  (check-equal? (posn-multiply (posn 2 3) (posn -5 2))
                (posn -10 6)))


(define/match (posn-divide posn1 posn2)
  [((posn x1 y1) (posn x2 y2))
   (posn (/ x1 x2) (/ y1 y2))])

(module+ test
  (check-equal? (posn-divide (posn 10 6) (posn 5 -2))
                (posn 2 -3)))


(define posn-product
  (foldl posn-multiply (posn 1 1) _))

(module+ test
  (check-equal? (posn-product (list (posn 3 5) (posn 7 2) (posn -2 3)))
                (posn -42 30)))
