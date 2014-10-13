(defun turn-on-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun turn-on-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8) (hl-line-mode t)))

(defun turn-on-save-place-mode ()
  (setq save-place t))

(defun turn-on-whitespace ()
  (whitespace-mode t))

(defun turn-on-paredit ()
  (paredit-mode t))

(defun turn-off-tool-bar ()
  (tool-bar-mode -1))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun turn-on-subword-mode ()
  (when (fboundp 'subword-mode)
            (subword-mode 1)
            (c-subword-mode 1)))

(require 'fill-column-indicator)
(defun turn-on-fci-mode ()
  (fci-mode 1))

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(add-hook 'coding-hook 'turn-on-column-number-mode)
(add-hook 'coding-hook 'turn-on-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
(add-hook 'coding-hook 'add-watchwords)
(add-hook 'coding-hook 'turn-on-subword-mode)
(add-hook 'coding-hook 'turn-on-fci-mode)

(defun run-coding-hook ()
  (run-hooks 'coding-hook))


(provide 'coding)
