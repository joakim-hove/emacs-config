(defun jh-compile ()
  (interactive)
  (require 'helm-make)
  (helm--make-action "ScheduleTests")
  )