#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(posn-transform-relative [new-origin posn?]
                                  [transform (-> posn? posn?)]
                                  [a-posn posn?])
         posn?]{
  Given a @racket[transform] that moves a @racket[posn?] in
  a way that is relative to the origin, returns a new @racket[posn?]
  that transforms @racket[a-posn] with the @racket[transform] relative
  to @racket[new-origin].
  @posn-examples[
    (posn-rotate-origin-ccw-90 (posn 2 1))
    (posn-transform-relative (posn 20 20)
                             posn-rotate-origin-ccw-90
                             (posn 22 21))
]}
