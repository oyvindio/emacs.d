(use-package ruby-mode
  :mode (("\\.rake$" . ruby-mode)
         ("\\.gemspec$" . ruby-mode)
         ("\\.ru$" . ruby-mode)
         ("Rakefile$" . ruby-mode)
         ("Gemfile$" . ruby-mode)
         ("Capfile$" . ruby-mode)
         ("Vagrantfile$" . ruby-mode)
         ("Buildfile$" . ruby-mode)
         ("\\.spec$" . ruby-mode))
  :config
  (add-hook 'ruby-mode-hook 'run-coding-hook)
  (auto-fill-mode 0)
  (add-to-list 'completion-ignored-extensions ".rbc")
  :bind (:map ruby-mode-map
              ("<Return>" . reindent-then-newline-and-indent)
              ("C-M-h" . backward-kill-word)))

(use-package rbenv
  :ensure t
  :after ruby-mode
  :config
  (setq rbenv-executable (executable-find "rbenv"))
  (rbenv-use-global))

(provide 'my-ruby)
