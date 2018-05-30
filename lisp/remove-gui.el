(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

(when (eq system-type 'darwin)
  ;; Make titlebar transparent
  ;; This should happen as early as possible to avoid flicker
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(provide 'remove-gui)
