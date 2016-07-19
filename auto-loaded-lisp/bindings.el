(global-set-key (kbd "C-h a") 'apropos)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x r s") 'replace-string)
(global-set-key (kbd "C-x r r") 'replace-rectangle)
(global-set-key (kbd "C-x d") 'duplicate-line)
(global-set-key (kbd "C-c C-g") 'gist-buffer-confirm)
(global-set-key (kbd "C-x a a") 'ack)
(global-set-key (kbd "C-x C-h") 'mark-whole-buffer)


;; free up M-c for other key bindings; capitalize-word isn't THAT
;; important
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c c") 'capitalize-word)
(global-set-key (kbd "M-c u") 'view-url)
(global-set-key (kbd "M-c e") 'base64-encode-region)
(global-set-key (kbd "M-c d") 'base64-decode-region)

(global-set-key (kbd "M-S-<up>") 'move-line-up)
(global-set-key (kbd "M-S-<down>") 'move-line-down)

;; C-w should do backward-kill-word, like in the shell
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-M-s") 'isearch-current-symbol)
(global-set-key (kbd "C-M-r") 'isearch-backward-current-symbol)
(global-set-key (kbd "C-c e") 'eval-and-replace)
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

(global-set-key (kbd "M-s-e") 'er/expand-region)
(global-set-key (kbd "M-s-s") 'mc/mark-next-like-this)
(global-set-key (kbd "M-s-r") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-s-a") 'mc/mark-all-like-this)

(global-set-key (kbd "M-\\") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-s-n") 'next-buffer)
(global-set-key (kbd "M-s-p") 'previous-buffer)
(global-set-key (kbd "M-g l") 'goto-line-with-feedback)

(global-set-key (kbd "s-b") 'browse-url)

(global-set-key (kbd "M-s-q") 'toggle-quotes)

(setq yas/trigger-key "M-g e")


(when (eq system-type 'darwin)
  (global-set-key (kbd "<f9>") 'toggle-frame-fullscreen)

  ;; I'm using US keyboard layout on a Norwegian keyboard, with s-';[
  ;; mapped to the Norwegian letters æøå, and needed to get this to
  ;; work in emacs as well.
  (global-set-key (kbd "s-[") (lambda () (interactive) (insert "å")))
  (global-set-key (kbd "s-{") (lambda () (interactive) (insert "Å"))) 

  (global-set-key (kbd "s-'") (lambda () (interactive) (insert "æ")))
  (global-set-key (kbd "s-\"") (lambda () (interactive) (insert "Æ")))

  (global-set-key (kbd "s-;") (lambda () (interactive) (insert "ø")))
  (global-set-key (kbd "s-:") (lambda () (interactive) (insert "Ø")))

  ;; In Emacs 23 (Cocoa) in Snow Leopard, Apple delete key deletes
  ;; backward, not forward as is usual. This fixes this behaviour.
  (if (display-graphic-p)
      (normal-erase-is-backspace-mode 1))

  ;; cmd as meta
  (when (equal system-type 'darwin)
    (setq ns-command-modifier 'meta)
    (setq ns-option-modifier 'super))

  ;; Stop showing me the print dialog when i use this hotkey, it's never what i want
  (global-unset-key (kbd "s-p")))

(global-set-key  [C-tab] 'other-window)
(add-hook 'org-mode-hook
          (lambda ()
            ; don't hijack my keybinding, org-mode
            (define-key org-mode-map [C-tab] 'other-window)
            ; org-todo is bound to C-c C-t, which apparently is hard
            ; to get right...
            (define-key org-mode-map (kbd "C-c t") 'org-todo)))

;; (eval-after-load 'browse-kill-ring
  ;; (global-set-key (kbd "M-c b") 'browse-kill-ring))

(global-set-key (kbd "C-x C-c")
                '(lambda ()
		   (interactive)
		   (if (y-or-n-p "Do you really want to exit Emacs ? ")
		       (save-buffers-kill-emacs))))

(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(provide 'bindings)
