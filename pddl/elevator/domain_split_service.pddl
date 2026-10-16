; Add exactly this static movement predicate:
;   (link ?e - elevator ?from - floor ?to - floor)
; move must require both (lift-at ?e ?from) and (link ?e ?from ?to).
; board and leave retain their baseline meaning.
; Delete the TODO-STUDENT line only when the file is complete.

(define (domain elevator-split-service)
  (:requirements :strips :typing)
  (:types elevator passenger floor)

  (:predicates
    (lift-at ?e - elevator ?f - floor)
    (passenger-at ?p - passenger ?f - floor)
    (boarded ?p - passenger ?e - elevator)
    (link ?e - elevator ?from - floor ?to - floor)
    
  )

  (:action move
    :parameters (?e - elevator ?from - floor ?to - floor)
    :precondition (and
      (lift-at ?e ?from)
      (link ?e ?from ?to)
    )
    :effect (and
      (lift-at ?e ?to)
      (not (lift-at ?e ?from))
    )
  )

  (:action board
    :parameters (?p - passenger ?e - elevator ?f - floor)
    :precondition (and
      (passenger-at ?p ?f)
      (lift-at ?e ?f)
    )
    :effect (and
      (boarded ?p ?e)
      (not (passenger-at ?p ?f))
    )
  )

  (:action leave
    :parameters (?p - passenger ?e - elevator ?f - floor)
    :precondition (and
      (boarded ?p ?e)
      (lift-at ?e ?f)
    )
    :effect (and
      (passenger-at ?p ?f)
      (not (boarded ?p ?e))
    )
  )

)
