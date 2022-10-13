(use-package org
  :ensure t
  :bind (:map org-mode-map
         ([C-tab] . other-window)
         ("C-c t" . org-todo)
         ("C-c l" . org-store-link))
  :config
  (setq org-src-fontify-natively t)
  (setq org-clock-rounding-minutes 5)
  (setq org-clock-clocked-in-display nil)
  (setq org-clock-persist t)
  (org-clock-persistence-insinuate)
  (add-hook 'org-mode-hook 'visual-line-mode))


(provide 'my-org)
