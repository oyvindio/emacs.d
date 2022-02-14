(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
              ("s-<f7>" . lsp-find-references)
              ("M-g d" . lsp-find-definition)))
(use-package lsp-ui
  :ensure t
  :bind (:map lsp-ui-mode-map
              ("s-l" . nil)
              ("s-l i" . lsp-ui-imenu)))

(provide 'my-lsp)
