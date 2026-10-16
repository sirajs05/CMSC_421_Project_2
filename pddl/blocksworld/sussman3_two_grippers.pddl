; Re-create the three-block Sussman instance using blocks-two-grippers.
; Required grippers: left and right. Both must start free.
; Delete the TODO-STUDENT line only when the file is complete.

(define (problem blocks-sussman-3-two-grippers)
  (:domain blocks-two-grippers)
  (:objects
    a b c - block
    left right - gripper)

  (:init
    
    (on c a)
    (ontable a) (ontable b)
    (clear b) (clear c)
    (free left) (free right)

  )

  (:goal (and
    
    (on a b)
    (on b c)

  ))
)
