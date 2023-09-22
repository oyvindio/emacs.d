(use-package eglot
  :bind (:map eglot-mode-map
              ("M-/" . completion-at-point)
              ("s-l" . nil)
              ("s-l d" . eldoc)
              ("s-l e" . flymake-show-buffer-diagnostics)
              ("s-l r" . eglot-rename)
              ("s-l =" . eglot-format)
              ("s-l i" . eglot-code-action-organize-imports)
              )
  )

(provide 'my-eglot)
