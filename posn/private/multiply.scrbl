#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(posn-multiply [posn1 posn?] [posn2 posn?]) posn?]{
  Returns a new @racket[posn] created by multiply the x coordinates
  and y coordinates of @racket[posn1] and @racket[posn2].
  @posn-examples[
    (posn-multiply (posn 2 3) (posn -5 2))
]}

@defproc[(posn-divide [posn1 posn?] [posn2 posn?]) posn?]{
  Returns a new @racket[posn] created by dividing the x coordinates
  and y coordinates of @racket[posn1] and @racket[posn2].
  @posn-examples[
    (posn-divide (posn 10 6) (posn 5 -2))
]}

@defproc[(posn-product [posns (listof posn?)]) posn?]{
  Returns the product of all the @racket[posns].
  @posn-examples[
    (posn-product (list (posn 3 5) (posn 7 2) (posn -2 3)))
]}
