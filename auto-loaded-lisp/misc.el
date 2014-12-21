(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default fill-column 118)
(setq  visible-bell t
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab
                         face indentation space-after-tab)
      whitespace-line-column 120
      ediff-window-setup-function 'ediff-setup-windows-plain
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (dot-emacs-relative "places")
      backup-directory-alist `(("." . ,(dot-emacs-relative "backups")))
      indicate-empty-lines t
      imenu-auto-rescan t)

(auto-compression-mode t)
(global-font-lock-mode t)
(recentf-mode 1)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'column-number-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator
(defalias 'auto-revert-tail-mode 'tail-mode)

;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)
(delete 'try-complete-file-name-partially hippie-expand-try-functions-list)
(delete 'try-complete-file-name hippie-expand-try-functions-list)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (dot-emacs-relative "backups")))))

;; Don't clutter up directories with #files# either
(setq auto-save-file-name-transforms
      `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat (expand-file-name
                                             (dot-emacs-relative "backups/")) "\\1") t)))

;; Don't let tramp clutter up directories with files either
(setq tramp-backup-directory-alist backup-directory-alist)

(defun underscore-as-word-separator ()
  (modify-syntax-entry ?_ "_"))
(add-hook 'change-major-mode-hook 'underscore-as-word-separator)

(when (boundp 'focus-out-hook)
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t))))

(global-hl-line-mode t)
(delete-selection-mode 1)
(global-auto-revert-mode 1)

;; Make kill-region (C-w)  and kill-ring-save (M-w) use the line at
;; point if no region is selected, like cut and copy in IDEA
(transient-mark-mode t)
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(when (eq system-type 'darwin)
  ;; Move to trash on delete
  (setq delete-by-moving-to-trash t)
  ;; use spotlight for locate
  (setq locate-command "mdfind"))

(provide 'misc)
