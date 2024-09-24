(use-package eglot
  :bind (:map eglot-mode-map
              ("M-/" . completion-at-point)
              ("s-l" . nil)
              ("s-l d" . eldoc)
              ("s-l e" . flymake-show-buffer-diagnostics)
              ;; ("s-l r" . eglot-rename) ; Use M-? (`xref-find-references`), then r to query replace
              ("s-l =" . eglot-format)
              ("s-l i" . eglot-code-action-organize-imports)
              ("s-l g i" . eglot-find-implementation)
              ;; ("s-l g d" . eglot-find-declaration) ; use M-. (`xref-find-definitions`)
              ("s-l g t" . eglot-find-typeDefinition)
              ("C-x M-." . xref-find-definitions-other-window)
              ("C-x M-?" . xref-find-references-and-replace)
              )
  )

(provide 'my-eglot)
