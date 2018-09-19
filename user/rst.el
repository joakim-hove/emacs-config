(defun insert-header (header level)
  (interactive "MHeader: \nnLevel: ")
  (insert header)
  (newline)
  (let ((line-string (cond
                      ((equal level 1) "=")
                      ((equal level 2) "-")
                      ((equal level 3) "~")
                      ((equal level 4) "."))))

    (cl-loop
     repeat (length header)
     do (insert line-string)))
  (newline 2))

(defun insert-inline-block( block )
  (insert " :" block ": `'")
  (backward-char 1)
  (evil-insert 1))


(defun insert-paragraph-block( block )
  (beginning-of-line)
  (insert ".. math::\n")
  (insert "   ")
  (evil-insert 1))


(defun insert-block (block)
  (interactive "MBlock: ")
  (if (y-or-n-p "Inline :")
      (insert-inline-block block)
    (insert-paragraph-block block)))


(defun insert-figure (fname)
  (interactive "fPicture file: ")
  (let ((relative-fname (file-relative-name fname (file-name-directory (buffer-file-name)))))

    (insert ".. figure:: " relative-fname "\n"))
  (insert "   :scale: 100%\n")
  (insert "\n")
  (insert "   ")
  (evil-insert 1))


(defun make-link (p1 p2 project)
  (goto-char p1)
  (insert "`")
  (goto-char (1+ p2))
  (let ((prstring (buffer-substring-no-properties p1 (1+ p2)))
        (pr))
    (if (string-match ".*?\\([[:digit:]]+\\)" prstring)
        (insert (format " <http://github.com/Statoil/%s/pull/%s/>`_" project (match-string 1 prstring))))))


(defun make-ert-link (p1 p2)
  (interactive "r")
  (make-link p1 p2 "ert"))

(defun make-ecl-link (p1 p2)
  (interactive "r")
  (make-link p1 p2 "libecl"))

(defun make-res-link (p1 p2)
  (interactive "r")
  (make-link p1 p2 "res"))


(provide 'rst.el)
