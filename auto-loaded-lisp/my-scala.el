(use-package scala-mode
  :ensure t
  :mode (("\\.scala$" . scala-mode)
         ("\\.sbt$" . scala-mode))
  :commands scala-mode)

(provide 'my-scala)
