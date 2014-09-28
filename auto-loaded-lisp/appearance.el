(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system
  (load "color-theme-sanityinc-solarized")
  (set-face-attribute 'default nil :font "Source Code Pro 12")
  (color-theme-sanityinc-solarized-light)
  (set-exec-path-from-shell-PATH)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (server-start)
  
  ;; Don't pop up new frames when opening files via drag n drop or
  ;; open with in OS X
  (when (eq system-type 'darwin)
    (setq ns-pop-up-frames nil)))

(provide 'appearance)
