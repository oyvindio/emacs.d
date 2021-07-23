(use-package swiper
  :ensure t)

(defun counsel-ibuffer-find-file (file &optional wildcards)
  "Like `find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((initial-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (counsel-find-file nil initial-directory))))

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
         (:map counsel-find-file-map ("C-l" . counsel-up-directory))
         (:map ibuffer-mode-map ("C-x C-f" . counsel-ibuffer-find-file))
         ))

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
  (setq ivy-extra-directories nil)
  (setq ivy-height 25))

(provide 'my-ivy)
