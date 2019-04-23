;; (add-to-list 'load-path "~/Projects/git-modes")
;; (add-to-list 'load-path "~/Projects/magit")
;; (eval-after-load 'info
;;   '(progn (info-initialize)
;;           (add-to-list 'Info-directory-list  "~/Projects/magit")))
(require 'magit)

(add-hook 'magit-log-edit-mode-hook 'local-column-number-mode)

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(eval-after-load 'magit
  '(progn
     (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)
     (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
     (setq magit-backup-mode nil)
     (setq magit-diff-refine-hunk 'all)))

(global-set-key (kbd "C-x g") 'magit-status)
(define-key magit-mode-map [C-tab] 'other-window)
(define-key magit-mode-map (kbd "C-c t") 'magit-section-toggle)

(when (file-exists-p "/usr/local/bin/emacsclient")
  '(progn
     (setq magit-emacsclient-executable "/usr/local/bin/emacsclient")
     (setq with-editor-emacsclient-executable "/usr/local/bin/emacsclient")))

(provide 'my-magit)
