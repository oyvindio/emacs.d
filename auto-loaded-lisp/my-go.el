(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
