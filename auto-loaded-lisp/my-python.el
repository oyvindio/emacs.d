(use-package python-mode
  :ensure t
  :mode (("\\.py$" . python-mode)
         ("\\.wsgi$" . python-mode))
  :hook
  (python-mode . run-coding-hook)
  (python-mode . eglot-ensure)
  (python-ts-mode . run-coding-hook)
  (python-ts-mode . eglot-ensure)
  )


(use-package pyenv-mode
  :ensure t
  :after python-mode)

(use-package flycheck-prospector
  :ensure t
  :after python-mode)

(provide 'my-python)
