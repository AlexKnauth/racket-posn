#lang racket/base

(require
  scribble/eval
  "scribble-include-no-subsection.rkt"
  (for-label posn
             racket/base
             racket/contract))

(provide
 posn-examples
 (all-from-out "scribble-include-no-subsection.rkt")
 (for-label
  (all-from-out posn
                racket/base
                racket/contract)))


(define-syntax-rule (define-examples-form id require-spec ...)
  (begin
    (define (eval-factory)
      (define base-eval (make-base-eval))
      (base-eval '(require require-spec)) ...
      base-eval)
    (define-syntax-rule (id datum (... ...))
      (examples #:eval (eval-factory) datum (... ...)))))


(define-examples-form posn-examples posn)
