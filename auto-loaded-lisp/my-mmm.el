(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(mmm-autoload-class 'erb "mmm-erb")
(mmm-add-mode-ext-class nil "\\.erb\\'" 'erb)

(provide 'my-mmm)
