; Extend standard Blocks World to exactly two explicit grippers.
; Required predicates:
;   (free ?g - gripper)
;   (holding ?g - gripper ?x - block)
; Keep on / ontable / clear.
; Implement pickup, putdown, stack, and unstack with a ?g - gripper parameter.
; Delete the TODO-STUDENT line only when the file is complete.

(define (domain blocks-two-grippers)
  (:requirements :strips :typing)
  (:types block gripper)

  (:predicates    
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (free ?g - gripper)
    (holding ?g - gripper ?x - block)  
  )

  (:action pickup
    :parameters (?x - block ?g - gripper)
    :precondition (and (ontable ?x) (clear ?x) (free ?g))
    :effect (and 
      (holding ?g ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (free ?g))
    )
  )

  (:action putdown
    :parameters (?x - block ?g - gripper)
    :precondition (holding ?g ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (free ?g)
      (not (holding ?g ?x))  
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?g - gripper)
    :precondition (and (holding ?g ?x) (clear ?y))
    :effect (and   
      (on ?x ?y)
      (clear ?x)
      (free ?g)
      (not (holding ?g ?x))
      (not (clear ?y))
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?g - gripper)
    :precondition (and (on ?x ?y) (clear ?x) (free ?g))
    :effect (and   
      (holding ?g ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (free ?g))
    )
  )  
  
)