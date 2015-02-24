(require 'helm)
(require 'helm-config)
(require 'ibuffer)

(defun ibuffer-helm-find-file (file &optional wildcards)
  "Like `find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
			      (if (buffer-live-p buf)
				  (with-current-buffer buf
				    default-directory)
				default-directory))))
     (list (helm-read-file-name "Find file: ")
	   t)))
  (find-file file wildcards))

(define-key ibuffer-mode-map (kbd "C-x C-f") 'ibuffer-helm-find-file)


(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (helm-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-x c") 'helm-command-prefix)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-g f")  'helm-git-grep)
(global-set-key (kbd "M-g M-f")  'helm-git-grep)
(global-set-key (kbd "M-g k") 'helm-show-kill-ring)
(global-set-key (kbd "M-g i") 'helm-imenu)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-x C-M-f") 'helm-projectile-find-file)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z



(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount 8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-M-x-fuzzy-match t ; fuzzy-match in M-x minibuffer
      helm-buffers-fuzzy-matching t ; fuzzy-match buffers
      helm-recentf-fuzzy-match t ; fuzzy-match recentf
      helm-imenu-fuzzy-match t ; fuzzy-match imenu
      helm-apropos-function-list t ; fuzzy-match apropos
      )

(when (eq system-type 'darwin)
  (setq helm-c-locate-command "mdfind -name %s %s"))


(helm-mode 1)
(helm-projectile-on)

(provide 'my-helm)
