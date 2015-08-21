#lang scribble/manual

@(require "util/doc.rkt")


@defstruct*[posn ([x real?] [y real?]) #:prefab]{
  A prefab struct representing a point in 2d space.
  This library treats @racket[x] as increasing when
  moving to the right and @racket[y] as increasing
  when moving up.
  @posn-examples[
    (posn 1 2)
    (posn -3 5)
]}

@defthing[origin posn?]{
  A @racket[posn] representing the origin of the plane.
  Equivalent to @racket[(posn 0 0)].
}

@defthing[origin? predicate/c]{
  Predicate recognizing the @racket[origin].
}
