(require 'markdown-mode)

(setq markdown-css-paths (list (file-truename (concat user-emacs-directory "github-markdown.css"))))
(when (executable-find "pandoc")
  (setq markdown-command "pandoc -f markdown_github -t html5"))

