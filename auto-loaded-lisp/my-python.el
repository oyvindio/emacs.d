;; Load python-mode for .py and .wsgi files
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook 'run-coding-hook)

(require 'pytest)
(require 'pyenv-mode)
(eval-after-load 'python-mode
  '(progn
     (define-key python-mode-map (kbd "M-?") 'hippie-expand)
     (define-key python-mode-map (kbd "C-c t") 'pytest-all)))

(require 'flycheck-prospector)

;; (require 'lsp-mode)
;; (add-hook 'python-mode-hook 'lsp)

(provide 'my-python)
