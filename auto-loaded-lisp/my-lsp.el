(require 'lsp-mode)

; is lsp-ui-mode causing the sluggish cursor movement ?
; (require 'lsp-ui)
; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

(global-set-key (kbd "s-<f7>") 'lsp-find-references)
(global-set-key (kbd "M-g d") 'lsp-find-definition)

(provide 'my-lsp)
