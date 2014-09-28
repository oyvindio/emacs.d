(require 'package)
(package-initialize)

(defvar default-packages (list 'ruby-mode
                               'inf-ruby
                               'css-mode
                               'yaml-mode
                               'find-file-in-project
                               'magit
                               'js2-mode
                               'yasnippet-bundle
                               'full-ack
                               'paredit
                               'color-theme
                               'markdown-mode
                               'haskell-mode
                               'ghc
                               'ghci-completion
                               'expand-region
                               'multiple-cursors
                               'nose
                               ))


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-user-dir (dot-emacs-relative "elpa"))

(defun is-online ()
  "See if we're online.

Windows does not have the network-interface-list function, so we
just have to assume it's online."
  ;; TODO how could this work on Windows?
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                              (member 'up (first (last (network-interface-info
                                                        (car iface)))))))
            (network-interface-list))
    t))

(defun install-default-packages ()
  "Install all packages that aren't installed."
  (interactive)
  (dolist (package default-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

;; (when (is-online)
;;   (unless package-archive-contents (package-refresh-contents)
;;           (install-default-packages)))



(defun prelude-packages-installed-p ()
  (loop for p in default-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p default-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
