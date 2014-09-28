;; Load python-mode for .py and .wsgi files
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook 'run-coding-hook)
(add-hook 'auto-complete-mode-hook (lambda ()
                                     (define-key ac-completing-map (kbd "C-n") 'ac-next)
                                     (define-key ac-completing-map (kbd "C-p") 'ac-previous)))

(require 'pytest)
(eval-after-load 'python-mode
  '(progn
     (define-key py-mode-map (kbd "M-?") 'hippie-expand)
     (define-key py-mode-map (kbd "C-c t") 'pytest-all)))

(provide 'python)