(autoload 'js2-mode "js2-mode" "Start js2-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'moz-minor-mode)
(add-hook 'js2-mode-hook 'run-coding-hook)
(setq js2-basic-offset 2)
(setq js-indent-level 2)

(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

(provide 'my-js)
