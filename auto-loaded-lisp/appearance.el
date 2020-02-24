(setq solarized-high-contrast-mode-line t)
(setq solarized-use-less-bold t)
(load-theme 'solarized-light t)

(defun set-font-size (size)
  (set-face-attribute 'default nil :font (concat "Source Code Pro " size)))

(defun laptop-screen-font-size ()
  (interactive)
  (set-font-size "17"))

(defun 4k-screen-font-size ()
  (interactive)
  (set-font-size "21"))

(when window-system
  (4k-screen-font-size)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (pixel-scroll-mode t)
  (server-start)

  (when (eq system-type 'darwin)
    ;; Don't fullscreen emacs into its own space
    (setq ns-use-native-fullscreen nil)
    ;; Don't pop up new frames when opening files via drag n drop
    (setq ns-pop-up-frames nil)))

(provide 'appearance)
