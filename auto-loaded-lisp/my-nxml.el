(defun nxml-toggle-indent ()
  (interactive)
  (if (eq nxml-child-indent 2)
      (progn
        (setq nxml-child-indent 4)
        (display-message-or-buffer "Indenting with 4 spaces"))
    (progn
      (setq nxml-child-indent 2)
      (display-message-or-buffer "Indenting with 2 spaces"))))

(provide 'my-nxml)
