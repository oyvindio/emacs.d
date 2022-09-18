(use-package js2-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'run-coding-hook)
  :mode ("\\.js$" . js2-mode))
(provide 'my-js)
