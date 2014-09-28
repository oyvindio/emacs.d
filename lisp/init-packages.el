(require 'package)
(package-initialize)

(defvar default-packages (list 'ruby-mode
                               'inf-ruby
                               'css-mode
                               'yaml-mode
                               'find-file-in-project
                               'magit
                               'js2-mode
			       'js2-refactor
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
                               'flx-ido
                               'projectile
                               'pytest
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

(when (is-online)
  (unless package-archive-contents (package-refresh-contents)
          (install-default-packages)))

(provide 'init-packages)
