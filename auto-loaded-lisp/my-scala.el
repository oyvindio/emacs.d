(require 'scala-mode2)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'my-scala)
