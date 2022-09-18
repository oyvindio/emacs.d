(use-package markdown-mode
  :ensure t
  :config
  (defun my-markdown-css-path ()
    (file-truename (concat user-emacs-directory "github-markdown.css")))

  (if (executable-find "pandoc")
      (setq markdown-command (format "pandoc -f markdown_github --css=file://%s -t html5" (my-markdown-css-path)))
    (setq markdown-css-paths (list (my-markdown-css-path)))))
