(use-package puppet-mode
  :ensure t
  :mode ("\\.pp$" . puppet-mode)
  :config
  (add-hook 'puppet-mode-hook 'run-coding-hook))

(provide 'puppet)
