; Exact required initial facts and goals are listed in README.md and the handout.
; Delete the TODO-STUDENT line only when the file is complete.

(define (problem blocks-sussman-3)
  (:domain blocks)
  (:objects a b c - block)

  (:init
    
    (on c a)
    (ontable a) (ontable b)
    (clear b) (clear c)
    (handempty)

  )

  (:goal (and
    
    (on a b)
    (on b c)
    
  ))
)
