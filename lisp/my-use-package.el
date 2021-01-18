(eval-when-compile
  (when (not (package-installed-p 'use-package))
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

(provide 'my-use-package)
