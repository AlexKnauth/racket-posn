#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(posn-rotate-origin-ccw-90 [a-posn posn?]) posn?]{
  Returns @racket[a-posn] rotated ninety degrees counter
  clockwise around the origin.
  @posn-examples[
    (posn-rotate-origin-ccw-90 (posn 2 1))
]}

@defproc[(posn-rotate-origin-ccw-180 [a-posn posn?]) posn?]{
  Returns @racket[a-posn] rotated one hundred and eighty
  degrees counter clockwise around the origin.
  @posn-examples[
    (posn-rotate-origin-ccw-180 (posn 2 1))
]}

@defproc[(posn-rotate-origin-ccw-270 [a-posn posn?]) posn?]{
  Returns @racket[a-posn] rotated two hundred and seventy
  degrees counter clockwise around the origin.
  @posn-examples[
    (posn-rotate-origin-ccw-270 (posn 2 1))
]}

@defproc[(posn-rotate-origin-ccw [degrees (between/c 0 360)]
                                 [a-posn posn?])
         posn?]{
  Returns @racket[a-posn] rotated @racket[degrees] counter
  clockwise around the origin.
  @posn-examples[
    (posn-rotate-origin-ccw 70 (posn 1 1))
]}

@defproc[(posn-rotate-ccw [center-posn posn?]
                          [degrees (between/c 0 360)]
                          [a-posn posn?])
         posn?]{
  Returns @racket[a-posn] rotated @racket[degrees] counter
  clockwise around @racket[center-posn].
  @posn-examples[
    (posn-rotate-ccw (posn 20 20) 45 (posn 22 21))
]}
