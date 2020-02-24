(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

; go get golang.org/x/tools/cmd/goimports
(setq gofmt-command "goimports")
(defun enable-gofmt-on-save ()
  (add-hook 'before-save-hook 'gofmt-before-save))


(add-hook 'go-mode-hook 'enable-gofmt-on-save)
(add-hook 'go-mode-hook 'run-coding-hook)

(let ((gopath (getenv "GOPATH"))
      (gopath-fallback "~/src/go")
      (relative-playground-basedir "playground"))
  (if (null gopath)
      (setq go-playground-basedir (concat gopath-fallback "/" relative-playground-basedir)))
  (setq go-playground-basedir (concat gopath "/" relative-playground-basedir)))
