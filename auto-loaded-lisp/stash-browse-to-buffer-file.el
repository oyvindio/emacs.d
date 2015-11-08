(setq-default stash-executable (executable-find "stash"))

(defun stash-browse-to-buffer-file ()
  "Browse to the current buffer's file in Atlassian Stash, highlighting the line at point. Assumes that the current
file is in a git repository, and that the git repository has a remote that is a Stash instance."
  (interactive)
  (let* ((git-dir (file-truename (vc-root-dir)))
         (relative-file-name (file-relative-name (buffer-file-name) git-dir))
         (line-number (line-number-at-pos)))
    (if relative-file-name
        (let ((default-dir git-dir))
          (call-process stash-executable nil 0 nil "browse" "browse" "-l" (number-to-string line-number) relative-file-name))
      (message "Buffer %s does not have an associated file." (buffer-name)))))

(provide 'stash-browwse-to-buffer-file)
