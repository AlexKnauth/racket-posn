#lang racket/base

(module+ test
  (require doc-coverage
           posn)

  (check-all-documented 'posn))
