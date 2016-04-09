(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(mmm-autoload-class 'erb "mmm-erb")
(add-to-list 'auto-mode-alist '("\\.y\\(a\\)?ml\\.erb$" . yaml-mode))
(mmm-add-mode-ext-class 'yaml-mode "\\.y\\(a\\)?ml\\.erb\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.xml\\.erb$" . nxml-mode))
(mmm-add-mode-ext-class 'nxml-mode "\\.xml\\.erb\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.service\\.erb$" . conf-mode))
(mmm-add-mode-ext-class 'conf-mode "\\.service\\.erb\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.sh\\.erb$" . shell-script-mode))
(mmm-add-mode-ext-class 'shell-script-mode "\\.sh\\.erb\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.jinja2\\'" 'jinja2)
(add-to-list 'auto-mode-alist '("\\.j2\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.j2\\'" 'jinja2)
(add-to-list 'auto-mode-alist '("\\.html\\.j2\\'" . html-mode))


(defun add-mmm-parse-buffer-on-save-hook ()
  (add-hook 'after-save-hook 'mmm-parse-buffer nil t))

(add-hook 'mmm-mode-hook 'add-mmm-parse-buffer-on-save-hook)

(provide 'my-mmm)
