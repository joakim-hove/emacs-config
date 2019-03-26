;; Insert spaces instead of tabs
(setq-default indent-tabs-mode nil)
(put 'helm-make-build-dir 'safe-local-variable 'stringp)
(put 'compile-command 'safe-local-variable (lambda (_) t))

(load-file "~/work/elisp/helm-make/helm-make.el")
(setq helm-make-nproc 0)
