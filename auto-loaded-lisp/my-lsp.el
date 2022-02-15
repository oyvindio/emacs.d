(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
              ("s-<f7>" . lsp-find-references)
              ("M-g d" . lsp-find-definition)
              ("M-/" . completion-at-point)))
(use-package lsp-ui
  :ensure t
  :bind (:map lsp-ui-mode-map
              ("s-l" . nil)
              ("s-l i" . lsp-ui-imenu)
              ("M-." . lsp-ui-peek-find-definitions)
              ("M-?" . lsp-ui-peek-find-references)))

(provide 'my-lsp)
