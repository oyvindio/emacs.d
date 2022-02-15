(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

; go get golang.org/x/tools/cmd/goimports
(setq gofmt-command "goimports")
(defun enable-gofmt-on-save ()
  (add-hook 'before-save-hook 'gofmt-before-save))


(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "<C-return>") 'go-run))


(add-hook 'go-mode-hook 'enable-gofmt-on-save)
(add-hook 'go-mode-hook 'run-coding-hook)
(add-hook 'go-mode-hook 'lsp)

(let ((gopath (getenv "GOPATH"))
      (gopath-fallback "~/src/go")
      (relative-playground-basedir "playground"))
  (if (null gopath)
      (setq go-playground-basedir (concat gopath-fallback "/" relative-playground-basedir)))
  (setq go-playground-basedir (concat gopath "/" relative-playground-basedir)))

(setq go-playground-go-command "GO111MODULE=off go")
