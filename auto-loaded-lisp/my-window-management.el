(setq switch-to-buffer-obey-display-actions t)

(add-to-list 'display-buffer-alist
   '("\\*Flycheck errors\\*"
     (display-buffer-in-side-window
      (window-height . 0.25)
      (side . bottom))))

;(setq display-buffer-alist nil)

(provide 'my-window-management)
