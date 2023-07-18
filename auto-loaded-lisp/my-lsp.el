(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
              ("s-<f7>" . lsp-find-references)
              ("M-g d" . lsp-find-definition)
              ("M-/" . completion-at-point))
  :config
  ;; Some performance tuning as recommended here:  https://emacs-lsp.github.io/lsp-mode/page/performance
  ;; Increase gc threshold to 100MB (default is 800kB)
  (setq gc-cons-threshold (* 100 1000 1000))
  ;; Increase buffer size for reading subprocess output to 1MB (default is 4kB)
  (setq read-process-output-max (* 1024 1024))
  )
(use-package lsp-ui
  :ensure t
  :config
  ;; disable eldoc on hover, use eldoc buffer instead
  ;; (setq lsp-eldoc-enable-hover nil)
  ;; show the full docs in eldoc buffer, not just the symbol name
  ;; (setq lsp-eldoc-render-all t)
  :bind (:map lsp-ui-mode-map
              ("s-l" . nil)
              ("s-l i" . lsp-ui-imenu)
              ("M-." . lsp-ui-peek-find-definitions)
              ("M-?" . lsp-ui-peek-find-references)
              ("s-l h t" . lsp-ui-doc-toggle)))

(provide 'my-lsp)
