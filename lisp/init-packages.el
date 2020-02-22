(require 'package)
(package-initialize)

(setq default-packages (list 'ruby-mode
                             'inf-ruby
                             'css-mode
                             'yaml-mode
                             'find-file-in-project
                             'magit
                             'js2-mode
                             'js2-refactor
                             'full-ack
                             'paredit
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
                             'scala-mode
                             'fill-column-indicator
                             'rbenv
                             'puppet-mode
                             'dockerfile-mode
                             'json-mode
                             'helm
                             'helm-projectile
                             'helm-git-grep
                             'unfill
                             'smart-mark
                             'mmm-mode
                             'terraform-mode
                             'helm-flx
                             'python-mode
                             'restclient
                             'lua-mode
                             'browse-at-remote
                             'go-mode
                             'go-playground
                             'go-eldoc
                             'mmm-jinja2
                             'editorconfig
                             'flycheck
                             'helm-flycheck
                             'pyenv-mode
                             'markdown-mode
                             'toggle-quotes
                             'flycheck-prospector
                             'lsp-mode
                             'lsp-python
                             'solarized-theme
                             ))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

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
  (unless package-archive-contents
    (package-refresh-contents)
    (install-default-packages)))

(provide 'init-packages)
