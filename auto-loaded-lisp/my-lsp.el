(require 'lsp-mode)
(global-set-key (kbd "s-<f7>") 'lsp-find-references)
(global-set-key (kbd "M-g d") 'lsp-find-definition)

(provide 'my-lsp)
