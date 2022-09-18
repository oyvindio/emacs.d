(use-package projectile
  :ensure t
  :config
  (projectile-global-mode t)
  ; default projectile-mode-line is very slow and is executed on {next,previous}-line which makes navigation very slow
  (setq projectile-mode-line " Projectile"))
