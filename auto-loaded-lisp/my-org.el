(require 'org)

(setq org-src-fontify-natively t)
(org-display-inline-images t)

(setq org-clock-rounding-minutes 5)
(setq org-clock-clocked-in-display nil)

(defun my-org-autodone (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'my-org-autodone)

(add-hook 'org-mode-hook
          (lambda ()
            ; don't hijack my keybinding, org-mode
            (define-key org-mode-map [C-tab] 'other-window)
            ; org-todo is bound to C-c C-t, which apparently is hard
            ; to get right...
            (define-key org-mode-map (kbd "C-c t") 'org-todo)))

(provide 'my-org)
