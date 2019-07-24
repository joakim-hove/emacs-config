(defun has-clang-format()
  "Reformat buffer if .clang-format exists in the projectile root."
  (f-exists? (expand-file-name ".clang-format" (projectile-project-root))))


(defun jh-compile ()
  (interactive)
  (require 'helm-make)
  (helm--make-action "ScheduleTests"))


(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'substatement-open 0)

  (when (has-clang-format)
    (progn
      (define-key evil-normal-state-map "=" 'clang-format-region))))
  ;;(define-key c++-mode-map "=" 'clang-format-region))))


(defun init-c++()
  (interactive)
  (my-c++-mode-hook))

(add-hook 'c++-mode-hook 'my-c++-mode-hook 't)


