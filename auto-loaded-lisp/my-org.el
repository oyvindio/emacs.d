(defun my-org-autodone (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(use-package org
  :ensure t
  :bind (:map org-mode-map
         ([C-tab] . other-window)
         ("C-c t" . org-todo))
  :config
  (setq org-src-fontify-natively t)
  (setq org-clock-rounding-minutes 5)
  (setq org-clock-clocked-in-display nil)
  (setq org-clock-persist t)
  (add-hook 'org-after-todo-statistics-hook 'my-org-autodone))

(org-clock-persistence-insinuate)
(provide 'my-org)
