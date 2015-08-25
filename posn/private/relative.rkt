#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    posn-transform-relative (-> posn? (-> posn? posn?) posn? posn?)

require "base.rkt"
        "add.rkt"

module+ test
  require racket/lazy-require
          rackunit
  lazy-require
    "rotate.rkt" (posn-rotate-origin-ccw-90)


(define (posn-transform-relative new-origin posn-transform a-posn)
  (posn-add new-origin
            (posn-transform (posn-subtract a-posn new-origin))))

module+ test
  (check-equal? (posn-transform-relative (posn 20 20)
                                         posn-rotate-origin-ccw-90
                                         (posn 22 21))
                (posn 19 22))
