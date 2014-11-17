(defun recompile-user-emacs-directory  ()
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

;(add-hook 'kill-emacs-hook 'recompile-user-emacs-directory)
