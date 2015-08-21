#lang racket/base

(require racket/contract)

(module+ test
  (require rackunit))

(provide
 (contract-out
  [struct posn ([x real?] [y real?])]
  [origin? predicate/c]
  [origin origin?]))


(struct posn (x y) #:prefab)

(define origin (posn 0 0))

(module+ test
  (check-equal? origin (posn 0 0)))


(define (origin? v)
  (and (posn? v)
       (equal? v origin)))

(module+ test
  (check-true (origin? origin))
  (check-true (origin? (posn 0 0))))
