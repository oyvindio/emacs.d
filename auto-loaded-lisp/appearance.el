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
                                   ;; `(helm-ff-executable ((t (:foreground ,red))))
                                   ;; `(helm-ff-symlink ((t (:foreground ,magenta))))
                                   ;; `(helm-ff-invalid-symlink ((t (:background ,red))))

                                   ;; Use default colors for diff
                                   `(diff-added ((,light-class :background "#ddffdd" :foreground "#22aa22")
                                                 (,dark-class (:background "#335533" :foreground "#ddffdd"))
                                                 ))
                                   `(magit-diff-added ((,light-class :background "#ddffdd" :foreground "#22aa22")
                                                       (,dark-class (:background "#335533" :foreground "#ddffdd"))
                                                       ))
                                   `(diff-refine-added ((,light-class :background "#bbffbb" :foreground "#00aa00")
                                                        (,dark-class :background "#22aa22" :foreground "#ddffdd")
                                                        ))
                                   `(diff-added-highlight ((,light-class :background "#cceecc" :foreground "#22aa22")
                                                           (,dark-class :background "#336633" :foreground "#cceecc")
                                                           ))
                                   `(magit-diff-added-highlight ((,light-class :background "#cceecc" :foreground "#22aa22")
                                                                 (,dark-class :background "#336633" :foreground "#cceecc")
                                                                 ))
                                   `(diff-removed ((,light-class :background "#ffdddd" :foreground "#aa2222")
                                                   (,dark-class :background "#553333" :foreground "#ffdddd")
                                                   ))
                                   `(magit-diff-removed ((,light-class :background "#ffdddd" :foreground "#aa2222")
                                                         (,dark-class :background "#553333" :foreground "#ffdddd")
                                                         ))
                                   `(diff-refine-removed ((,light-class :background "#ffbbbb" :foreground "#aa0000")
                                                          (,dark-class :background "#aa2222" :foreground "#ffdddd")
                                                          ))
                                   `(diff-removed-highlight ((,light-class :background "#eecccc" :foreground "#aa2222")
                                                             (,dark-class :background "#663333" :foreground "#eecccc")
                                                             ))
                                   `(magit-diff-removed-highlight ((,light-class :background "#eecccc" :foreground "#aa2222")
                                                                   (,dark-class :background "#663333" :foreground "#eecccc")
                                                                   ))
                                   `(lsp-ui-peek-selection ((,light-class :background ,magenta :foreground ,base03)
                                                            (,dark-class :background ,magenta :foreground ,base03)))
                                   `(lsp-ui-peek-peek ((,light-class :background ,base03)
                                                       (,dark-class :background ,base03)))
                                   `(lsp-ui-peek-list ((,light-class :background ,base03)
                                                       (,dark-class :background ,base03)))
                                   `(lsp-ui-peek-list ((,light-class :background ,base03)
                                                       (,dark-class :background ,base03)))
                                   `(lsp-ui-peek-line-number ((,light-class :foreground ,base00)
                                                              (,dark-class :foreground ,base00)))
                                   `(lsp-ui-peek-highlight ((,light-class :background ,yellow :foreground ,base03)
                                                            (,dark-class :background ,yellow :foreground ,base03)))
                                   `(lsp-ui-peek-filename ((,light-class :foreground ,blue)
                                                           (,dark-class :foreground ,blue)))
                                   `(lsp-ui-peek-header ((,light-class :background ,base1 :foreground ,base03)
                                                         (,dark-class :background ,base1 :foreground ,base03)))
                                   ))))

  (solarized-create-theme-file 'light 'solarized-light-custom solarized-light-color-palette-alist
                               solarized-customizations)
  (solarized-create-theme-file 'dark 'solarized-dark-custom solarized-dark-color-palette-alist
                               solarized-customizations))

(setq solarized-high-contrast-mode-line t)
;;(load-theme 'solarized-light-custom t)
(load-theme 'solarized-dark-custom t)


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
  (server-start)

  (when (eq system-type 'darwin)
    ;; Don't fullscreen emacs into its own space
    (setq ns-use-native-fullscreen nil)
    ;; Don't pop up new frames when opening files via drag n drop
    (setq ns-pop-up-frames nil)))

(provide 'appearance)
