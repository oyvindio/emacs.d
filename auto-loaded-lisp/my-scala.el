(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

(define-key scala-mode-map [C-tab] 'other-window)

(provide 'my-scala)
