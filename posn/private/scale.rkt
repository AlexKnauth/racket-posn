#lang racket/base

(require fancy-app
         racket/contract
         racket/match
         "base.rkt")

(module+ test
  (require rackunit))

(provide
 (contract-out
  [posn-scale (-> real? posn? posn?)]
  [posn-scale-x (-> real? posn? posn?)]
  [posn-scale-y (-> real? posn? posn?)]
  [posn-scale-each (-> real? (listof posn?) (listof posn?))]
  [posn-scale-x-each (-> real? (listof posn?) (listof posn?))]
  [posn-scale-y-each (-> real? (listof posn?) (listof posn?))]))


(define (posn-scale scale-factor a-posn)
  (match a-posn
    [(posn x y)
     (posn (* scale-factor x) (* scale-factor y))]))

(module+ test
  (check-equal? (posn-scale 2 (posn 1 1)) (posn 2 2)))


(define (posn-scale-x scale-factor a-posn)
  (match a-posn
    [(posn x y)
     (posn (* scale-factor x) y)]))

(module+ test
  (check-equal? (posn-scale-x 2 (posn 1 1)) (posn 2 1)))


(define (posn-scale-y scale-factor a-posn)
  (match a-posn
    [(posn x y)
     (posn x (* scale-factor y))]))

(module+ test
  (check-equal? (posn-scale-y 2 (posn 1 1)) (posn 1 2)))


(define (posn-scale-each scale-factor posns)
  (map (posn-scale scale-factor _) posns))

(module+ test
  (check-equal? (posn-scale-each 2 (list (posn 1 1) (posn 2 2)))
                (list (posn 2 2) (posn 4 4))))


(define (posn-scale-x-each scale-factor posns)
  (map (posn-scale-x scale-factor _) posns))

(module+ test
  (check-equal? (posn-scale-x-each 2 (list (posn 1 1) (posn 2 2)))
                (list (posn 2 1) (posn 4 2))))


(define (posn-scale-y-each scale-factor posns)
  (map (posn-scale-y scale-factor _) posns))

(module+ test
  (check-equal? (posn-scale-y-each 2 (list (posn 1 1) (posn 2 2)))
                (list (posn 1 2) (posn 2 4))))

