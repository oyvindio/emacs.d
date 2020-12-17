(require 'package)

(setq default-packages (list
                        'browse-at-remote
                        'css-mode
                        'dockerfile-mode
                        'editorconfig
                        'expand-region
                        'find-file-in-project
                        'flx-ido
                        'flycheck
                        'flycheck-prospector
                        'ghc
                        'ghci-completion
                        'go-eldoc
                        'go-mode
                        'go-playground
                        'haskell-mode
                        'helm
                        'helm-flx
                        'helm-flycheck
                        'helm-git-grep
                        'helm-projectile
                        'inf-ruby
                        'js2-mode
                        'js2-refactor
                        'json-mode
                        'lsp-mode
                        'lsp-python-ms
                        'lsp-ui
                        'lua-mode
                        'magit
                        'markdown-mode
                        'mmm-jinja2
                        'mmm-mode
                        'multiple-cursors
                        'paredit
                        'projectile
                        'puppet-mode
                        'pyenv-mode
                        'pytest
                        'python-mode
                        'rbenv
                        'restclient
                        'ruby-mode
                        'rust-mode
                        'rust-playground
                        'scala-mode
                        'smart-mark
                        'solarized-theme
                        'terraform-mode
                        'toggle-quotes
                        'unfill
                        'yaml-mode
                        ))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
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
