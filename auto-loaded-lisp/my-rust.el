(autoload 'rust-mode "rust-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq rust-format-on-save t)

(eval-after-load 'rust-mode
  '(progn
     (define-key rust-mode-map (kbd "C-c C-c") 'rust-compile)
     (define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
     (define-key rust-mode-map (kbd "C-c C-t") 'rust-test)
     ))


(eval-after-load 'cargo
  '(progn
     (add-hook 'rust-mode-hook 'cargo-minor-mode)))

(provide 'my-rust)
