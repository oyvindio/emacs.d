;; TODO: Use (executable-find "stash") when/if my stash PR is merged: https://bitbucket.org/atlassian/stash-command-line-tools/pull-requests/27
(setq-default stash-executable (file-truename "~/src/stash-command-line-tools/bin/stash"))

(defun file-path-relative-to-vc-root (file-path)
  (file-relative-name file-path (file-truename (vc-root-dir))))

(defun stash-browse-to-buffer-file ()
  "Browse to the current buffer's file in Atlassian Stash, highlighting the line at point. Assumes that the current
file is in a git repository, and that the git repository has a remote that is a Stash instance."
  (interactive)
  (let ((relative-file-name (file-path-relative-to-vc-root (buffer-file-name)))
        (line-number (line-number-at-pos)))
    (if relative-file-name
        (let ((default-dir (vc-root-dir)))
          (shell-command (format "%s browse browse -l %d %s" stash-executable line-number relative-file-name)))
      (message "Buffer %s does not have an associated file." buffer-name))))

(provide 'stash-browwse-to-buffer-file)
