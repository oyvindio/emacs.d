(eval-when-compile
  (when (not (package-installed-p 'use-package))
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

;; force load bind-key to avoid error void variable personal-keybindings in later use-package macros
(use-package bind-key)

(provide 'my-use-package)
