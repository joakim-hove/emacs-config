(require  'cl-macs)

(defun remove-trailing-whitespace ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\([ \t]+\\)$" (point-max) 't)
      (replace-match ""))))


(defun remove-inside-paren ()
  (interactive)
  (let ((p1 (+ (search-backward "(") 1))
        (p2 (- (search-forward  ")") 1)))
    (kill-region p1 p2)))


(defun window-rotate ()
  (interactive)
  (if (equal (count-windows) 2)
      (progn
        )))

(provide 'user-util.el)






