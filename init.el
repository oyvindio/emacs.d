(defun dot-emacs-relative (path)
  (concat user-emacs-directory path))

(add-to-list 'load-path (dot-emacs-relative "elpa"))
(add-to-list 'load-path (dot-emacs-relative "lisp"))
(add-to-list 'load-path (dot-emacs-relative "auto-loaded-lisp"))

(require 'cl)
(require 'remove-gui)
(require 'init-packages)

(setq custom-file (dot-emacs-relative "custom.el"))

;; load all elisp
(mapc 'load (directory-files (dot-emacs-relative "auto-loaded-lisp")
                             t "^[^#].*el$"))

