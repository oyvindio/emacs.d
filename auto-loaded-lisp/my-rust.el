(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(setq rust-format-on-save t)
(eval-after-load 'cargo
  '(progn
     (add-hook 'rust-mode-hook 'cargo-minor-mode)))
