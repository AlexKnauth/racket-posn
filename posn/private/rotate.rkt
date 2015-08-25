#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    posn-rotate-origin-ccw-90 (-> posn? posn?)
    posn-rotate-origin-ccw-180 (-> posn? posn?)
    posn-rotate-origin-ccw-270 (-> posn? posn?)
    posn-rotate-origin-ccw (-> degrees? posn? posn?)
    posn-rotate-ccw (-> posn? degrees? posn? posn?)

require fancy-app
        racket/match
        racket/math
        "base.rkt"
        "degrees.rkt"
        "relative.rkt"

module+ test
  require rackunit


module+ test
  (define current-tolerance (make-parameter 0.000000001))
  (define (tolerance=? a b)
    (<= (abs (- a b)) (current-tolerance)))
  (define-check (check-posn=? actual-posn expected-posn)
    (let ()
      (match-define (posn actual-x actual-y) actual-posn)
      (match-define (posn expected-x expected-y) expected-posn)
      (and (tolerance=? actual-x expected-x)
           (tolerance=? actual-y expected-y))))


(define (posn-rotate-origin-ccw-90 a-posn)
  (match-define (posn x y) a-posn)
  (posn (- y) x))

module+ test
  (check-equal? (posn-rotate-origin-ccw-90 (posn 2 1)) (posn -1 2))


(define (posn-rotate-origin-ccw-180 a-posn)
  (match-define (posn x y) a-posn)
  (posn (- x) (- y)))

module+ test
  (check-equal? (posn-rotate-origin-ccw-180 (posn 2 1)) (posn -2 -1))


(define (posn-rotate-origin-ccw-270 a-posn)
  (match-define (posn x y) a-posn)
  (posn y (- x)))

module+ test
  (check-equal? (posn-rotate-origin-ccw-270 (posn 2 1)) (posn 1 -2))


(define (posn-rotate-origin-ccw angle a-posn)
  (define theta (degrees->radians angle))
  (match-define (posn x y) a-posn)
  (define sin-t (sin theta))
  (define cos-t (cos theta))
  (define -sin-t (- sin-t))
  (define x2 (+ (* cos-t x) (* -sin-t y)))
  (define y2 (+ (* sin-t x) (* cos-t y)))
  (posn x2 y2))

module+ test
  (check-posn=? (posn-rotate-origin-ccw 90 (posn 1 2))
                (posn-rotate-origin-ccw-90 (posn 1 2)))
  (check-posn=? (posn-rotate-origin-ccw 180 (posn 1 2))
                (posn-rotate-origin-ccw-180 (posn 1 2)))
  (check-posn=? (posn-rotate-origin-ccw 270 (posn 1 2))
                (posn-rotate-origin-ccw-270 (posn 1 2)))
  (check-posn=? (posn-rotate-origin-ccw 45 (posn 1 1))
                (posn 0 (sqrt 2)))


(define (posn-rotate-ccw center-posn angle a-posn)
  (posn-transform-relative center-posn
                           (posn-rotate-origin-ccw angle _)
                           a-posn))
