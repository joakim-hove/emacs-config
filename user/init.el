(setq user-lisp-directory (concat (file-name-directory load-file-name)))

(defun load-user-lisp (fname)
  (load-file (concat user-lisp-directory fname)))


(load-user-lisp "rst.el")
(load-user-lisp "util.el")
(load-user-lisp "settings.el")


