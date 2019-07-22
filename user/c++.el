(defun jh-compile ()
  (interactive)
  (require 'helm-make)
  (helm--make-action "ScheduleTests"))


(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'substatement-open 0))


(add-hook 'c++-mode-hook 'my-c++-mode-hook)
