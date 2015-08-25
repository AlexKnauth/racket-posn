#lang racket/base

(require racket/contract
         racket/math)

(provide
 (contract-out
  [tau radians?]
  [degrees? predicate/c]
  [radians? predicate/c]
  [modulo-degrees (-> real? degrees?)]
  [modulo-radians (-> real? radians?)]))


(define tau (* 2 pi))

(define (degrees? x)
  (and (real? x)
       (<= 0 x 360)))

(define (radians? x)
  (and (real? x)
       (<= 0 x tau)))

(define (modulo-degrees x)
  (modulo x 360))

(define (modulo-radians x)
  (modulo x tau))
