(require 'color-theme)
(require 'color-theme-sanityinc-solarized)

(when window-system
  (load "color-theme-sanityinc-solarized")
  (set-face-attribute 'default nil :font "Source Code Pro 14")
  (color-theme-sanityinc-solarized-light)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (server-start)
  

  (when (eq system-type 'darwin)
    ;; Don't fullscreen emacs into its own space
    (setq ns-use-native-fullscreen nil)
    ;; Don't pop up new frames when opening files via drag n drop
    (setq ns-pop-up-frames nil)))

(provide 'appearance)
