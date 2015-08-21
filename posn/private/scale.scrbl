#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(posn-scale [scale-factor real?] [a-posn posn?]) posn?]{
  Scales @racket[a-posn]'s x and y coordinates by @racket[scale-factor].
  @posn-examples[
    (posn-scale 3 (posn 1 2))
]}

@defproc[(posn-scale-x [scale-factor real?] [a-posn posn?]) posn?]{
  Scales @racket[a-posn]'s x coordinate by @racket[scale-factor].
  @posn-examples[
    (posn-scale-x 3 (posn 1 2))
]}

@defproc[(posn-scale-y [scale-factor real?] [a-posn posn?]) posn?]{
  Scales @racket[a-posn]'s y coordinate by @racket[scale-factor].
  @posn-examples[
    (posn-scale-y 3 (posn 1 2))
]}

@defproc[(posn-scale-each [scale-factor real?] [posns (listof posn?)]) (listof posn?)]{
  Scales each @racket[posn] in @racket[posns] by @racket[scale-factor]
  @posn-examples[
    (posn-scale-each 3 (list (posn 1 2) (posn 4 5) (posn 7 8)))
]}

@defproc[(posn-scale-x-each [scale-factor real?] [posns (listof posn?)]) (listof posn?)]{
  Scales the x coordinate of each @racket[posn] in @racket[posns] by @racket[scale-factor]
  @posn-examples[
    (posn-scale-x-each 3 (list (posn 1 2) (posn 4 5) (posn 7 8)))
]}

@defproc[(posn-scale-y-each [scale-factor real?] [posns (listof posn?)]) (listof posn?)]{
  Scales the y coordinate of each @racket[posn] in @racket[posns] by @racket[scale-factor]
  @posn-examples[
    (posn-scale-y-each 3 (list (posn 1 2) (posn 4 5) (posn 7 8)))
]}
