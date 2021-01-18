(use-package swiper
  :ensure t)

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x m" . counsel-M-x)
         ("C-x C-m" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x f" . counsel-recentf)
         ("M-g f" . counsel-git-grep)
         ("M-g M-f" . counsel-git-grep)
         ("M-g i" . counsel-imenu)
         (:map counsel-find-file-map ("C-l" . counsel-up-directory))))

(use-package counsel-projectile
  :ensure t
  :bind (("C-x C-M-f" . counsel-projectile-find-file)))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-wrap t)
  (setq ivy-extra-directories nil))

(provide 'my-ivy)
