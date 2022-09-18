(use-package haskell-mode
  :ensure t
  :mode ("*.hs" . haskell-mode)
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

  (defun is-header (line)
    (string-match "^.*\\.hs:" line))

  (defun file-name-and-info-from-header (line)
    (let ((separated (split-string line ":")))
      (list (car separated) (cadr separated) (caddr separated))))


  (defun parse-until-next-header (lines acumulator)
    (if (or (null lines) (is-header (car lines)))
        (list (reverse acumulator) lines)
      (parse-until-next-header (cdr lines) (cons (car lines) acumulator))))

  (defun parse-all-errors (lines)
    (let ((next (parse-until-next-header lines (list))))
      (if (null (cadr next))
          '()
        (gather-errors (cadr next)))))

  (defun gather-errors (lines)
    (if (null lines) (list)
      (let ((first (file-name-and-info-from-header (car lines)))
            (next (parse-until-next-header (cdr lines) (list))))
        (cons (flycheck-error-new
               :filename (car first)
               :line (string-to-number (cadr first))
               :column (string-to-number (caddr first))
               :message (mapconcat 'identity (car next) "\n")
               :level (if (string-match ".*Warning.*" (car (car next)))
                          'warning 'error))
              (gather-errors (cadr next))))))

  (defun parse-ghc-output (ghc-output checker buffer)
    (parse-all-errors (split-string ghc-output "\n")))

  (defun parse-hlint-output (hlint-output checker buffer)
    (if (string-match ".*No suggestions.*" hlint-output)
        (list)
      (gather-errors (split-string hlint-output "\n")))))

(use-package ghc
  :ensure t)

(use-package ghci-completion
  :ensure t)

(provide 'haskell)
