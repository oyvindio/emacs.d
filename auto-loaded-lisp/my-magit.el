(require 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(use-package magit
  :ensure t
  :config
  (setq magit-diff-refine-hunk 'all)
  :commands magit-status
  :bind
  ("C-x g" . magit-status)
  (:map magit-mode-map
        ("C-<tab>" . other-window))
  (:map magit-status-mode-map
        ("q" . magit-quit-session)))

(defun set-git-commit-fill-column ()
  (setq fill-column 72))

(use-package git-commit
  :ensure t
  :config
  (setq git-commit-summary-max-length 50)
  (add-hook 'git-commit-mode-hook 'set-git-commit-fill-column))

(provide 'my-magit)
