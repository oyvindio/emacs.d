(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(setq json-reformat:indent-width 2)

(provide 'my-json)
