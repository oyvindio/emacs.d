(use-package terraform-mode
  :ensure t
  :init
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
  :mode ("\\.tf" . terraform-mode))

(provide 'my-terraform)
