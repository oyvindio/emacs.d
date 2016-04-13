(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

; go get github.com/nsf/gocode
(require 'go-eldoc)

; go get golang.org/x/tools/cmd/goimports
(setq gofmt-command "goimports")
(defun enable-gofmt-on-save ()
  (add-hook 'before-save-hook 'gofmt-before-save))

; go get github.com/rogpeppe/godef
(defun enable-godef-jump ()
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'enable-godef-jump)
(add-hook 'go-mode-hook 'enable-gofmt-on-save)
(add-hook 'go-mode-hook 'run-coding-hook)
