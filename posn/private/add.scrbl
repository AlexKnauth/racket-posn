#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(posn-add [posn1 posn?] [posn2 posn?]) posn?]{
  Returns the sum of @racket[posn1] and @racket[posn2].
  @posn-examples[
    (posn-add (posn 1 2) (posn 5 -3))
]}

@defproc[(posn-subtract [posn1 posn?] [posn2 posn?]) posn?]{
  Returns the difference of @racket[posn1] and @racket[posn2].
  @posn-examples[
    (posn-subtract (posn 2 3) (posn 5 2))
]}

@defproc[(posn-negate [posn posn?]) posn?]{
  Returns the negation @racket[posn], flipping the signs of both it's x and y parts.
  @posn-examples[
    (posn-negate (posn 5 -1))
]}

@defproc[(posn-sum [posns (listof posn?)]) posn?]{
  Returns the sum of all the @racket[posns].
  @posn-examples[
    (posn-sum (list (posn 1 1) (posn 4 2) (posn 2 -5)))
]}
