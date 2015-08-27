#lang info


(define collection 'multi)


(define version "0.1")


(define deps
  '("scribble-lib"
    "base"
    "sweet-exp"
    "fancy-app"))


(define build-deps
  '("cover"
    "rackunit-lib"
    "racket-doc"
    "scribble-lib"
    "doc-coverage"))


(define test-omit-paths
  '("posn/main.scrbl"
    "posn/private/add.scrbl"
    "posn/private/base.scrbl"
    "posn/private/multiply.scrbl"
    "posn/private/scale.scrbl"))
