(use-package python-mode
  :ensure t
  :mode (("\\.py$" . python-mode)
         ("\\.wsgi$" . python-mode))
  :config
  (add-hook 'python-mode-hook 'run-coding-hook)
  (add-hook 'python-mode-hook 'eglot-ensure)
  )


(use-package pyenv-mode
  :ensure t
  :after python-mode)

(use-package flycheck-prospector
  :ensure t
  :after python-mode)

(provide 'my-python)
