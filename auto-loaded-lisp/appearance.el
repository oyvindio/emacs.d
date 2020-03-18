(setq color-theme-obsolete nil)
;; (require 'color-theme)
;; (require 'color-theme-sanityinc-solarized)
;; (color-theme-sanityinc-solarized-light)
;; (color-theme-sanityinc-solarized-dark)

(require 'solarized-theme)
(require 'solarized-palettes)
(let ((solarized-customizations `((custom-theme-set-faces
                                   theme-name
                                   ;; More visible cursor
                                   `(cursor ((,class (:foreground ,base03 :background ,magenta :inverse-video t))))
                                   ;; More colors when highlighting code
                                   `(font-lock-builtin-face ((t (:foreground ,green))))
                                   `(font-lock-constant-face ((t (:foreground ,violet))))
                                   `(font-lock-variable-name-face ((t (:foreground ,yellow))))
                                   ;; Same colors as Solarized iterm2 theme for common file types in helm-find-files
                                   `(helm-ff-executable ((t (:foreground ,red))))
                                   `(helm-ff-symlink ((t (:foreground ,magenta))))
                                   `(helm-ff-invalid-symlink ((t (:background ,red))))
                                   ))))
  (solarized-create-theme-file 'light 'solarized-light-custom solarized-light-color-palette-alist
                               solarized-customizations)
  (solarized-create-theme-file 'dark 'solarized-dark-custom solarized-light-color-palette-alist
                               solarized-customizations))

(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-light-custom t)
;; (load-theme 'solarized-dark-custom t)


(defun set-font-size (size)
  (set-face-attribute 'default nil :font (concat "Source Code Pro " size)))

(defun laptop-screen-font-size ()
  (interactive)
  (set-font-size "17"))

(defun 4k-screen-font-size ()
  (interactive)
  (set-font-size "21"))

(when window-system
  (if (and (> (display-pixel-width)  2560)
           (> (display-pixel-height) 1440))
      (4k-screen-font-size)
    (laptop-screen-font-size))
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
