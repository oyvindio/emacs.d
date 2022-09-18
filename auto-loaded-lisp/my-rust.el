(use-package rust-mode
  :ensure t
  :mode ("\\.rs" . rust-mode)
  :config
  (setq rust-format-on-save t)
  :bind (:map rust-mode-map
               ("C-c C-c" . rust-compile)
               ("C-c C-r" . rust-run)
               ("C-c C-t" . rust-test)))

(use-package cargo
  :ensure t
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package rust-playground
  :ensure t
  :after rust-mode)

(provide 'my-rust)
