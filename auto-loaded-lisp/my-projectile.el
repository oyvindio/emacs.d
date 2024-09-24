(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map ("C-c p" . projectile-command-map))
  :config
  (projectile-global-mode t)
  ; default projectile-mode-line is very slow and is executed on {next,previous}-line which makes navigation very slow
  (setq projectile-mode-line " Projectile"))
