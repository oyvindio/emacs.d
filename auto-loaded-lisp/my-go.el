(use-package go-mode
  :ensure t
  ;; :after lsp
  :config
  ;; (defun lsp-go-install-save-hooks ()
  ;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
  ;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
  ;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  (add-hook 'go-mode-hook 'run-coding-hook)
  ;; (add-hook 'go-mode-hook 'lsp)
  (add-hook 'go-mode-hook 'eglot-ensure)
  :bind
  (:map go-mode-map
        ("C-<return>" . go-test-current-test)
        ("C-M-<return>" . go-test-current-file))
  :mode ("\\.go$" . go-mode))

(use-package go-eldoc
  :ensure t)

(use-package go-playground
  :ensure t
  :after go-mode
  :config

  (let ((gopath (getenv "GOPATH"))
        (gopath-fallback "~/src/go")
        (relative-playground-basedir "playground"))
    (if (null gopath)
        (setq go-playground-basedir (concat gopath-fallback "/" relative-playground-basedir)))
    (setq go-playground-basedir (concat gopath "/" relative-playground-basedir)))

  (setq go-playground-go-command "GO111MODULE=off go"))
