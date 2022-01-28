;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun dot-emacs-relative (path)
  (concat user-emacs-directory path))

(add-to-list 'load-path (dot-emacs-relative "elpa"))
(add-to-list 'load-path (dot-emacs-relative "lisp"))
(add-to-list 'load-path (dot-emacs-relative "auto-loaded-lisp"))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'remove-gui)
(require 'init-packages)
(require 'my-use-package)
(require 'my-ivy)

(setq custom-file (dot-emacs-relative "custom.el"))

;; load all elisp
(mapc 'load (directory-files (dot-emacs-relative "auto-loaded-lisp")
                             t "^[^#].*el$"))

(if (file-exists-p (dot-emacs-relative "local.el"))
  (load (dot-emacs-relative "local.el")))
