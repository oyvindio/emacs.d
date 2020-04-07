(defun call-process-to-string (executable &rest args)
  "Calls `executable' with `args' using `call-function' and returns
any output written to stdout or stderr as a string"
  (with-temp-buffer
    (apply #'call-process executable nil '(t t) nil args)
    (goto-char (point-min))
    (buffer-substring-no-properties (point) (line-end-position))))

(defun stash/git-remote-url (git-repo-path &optional remote)
  "Gets the git remote url from the git repository in
`git-repo-path'. Defaults to the `origin' remote."
  (let ((default-directory git-repo-path)
        (remote (or remote "origin")))
    (call-process-to-string "git" "config" "--get" (format "remote.%s.url" remote))))

(defun stash/git-current-branch (git-repo-path)
  (let* ((default-directory git-repo-path)
         (ref (call-process-to-string "git" "symbolic-ref" "HEAD")))
    (if (string-match "refs\\/heads\\/[a-zA-Z0-9\-_\.]*" ref)
        ref
      (warn "Not a git branch `%s'" ref))))

(defun stash/base-url-from-remote (git-remote-url &optional stash-uses-http)
  "Tries to convert a git remote url from a git repo cloned from
a Atlassian Stash/Bitbucket Server instance to an url we can use
to browse to the repo in the web ui.

`stash-base-url-from-remote' tries to guess the url schema based
on the git remote url; e.g. if you cloned using http you'll get a
http url. However, if the git remote url is a ssh url it defaults
to https. Pass t as `stash-uses-http' to override this behavior."
  (let* ((url (url-generic-parse-url git-remote-url))
         (schema (url-type url))
         (host (url-host url))
         (path (url-filename url)))
    (let* ((stash-url-schema (cond
                              (stash-uses-http "http")
                              ((equal "https" schema) "https")
                              ((equal "http" schema) "http")
                              (t "https")))
           (path-match (string-match "\\/\\([a-zA-Z0-9\-_\.]*\\)\\/\\([a-zA-Z0-9\-_\.]*\\)\\.git" path)))
      (if path-match
          (let ((stash-project (match-string 1 path))
                (stash-repo (match-string 2 path)))
            (format "%s://%s/projects/%s/repos/%s" stash-url-schema host stash-project stash-repo))
        (error "Could not convert git remote url '%s' to a stash url" git-remote-url)))))

(defun stash/add-file-path-branch-and-line-number (stash-repo-url git-relative-file-path &optional git-branch line-number-part)
  (let ((git-branch-part (if git-branch (format "?at=%s" git-branch) ""))
        (line-number-fragment (if line-number-part (format "#%s" line-number-part) "")))
    (format "%s/browse/%s%s%s" stash-repo-url git-relative-file-path git-branch-part line-number-fragment)))

(defun stash/create-stash-file-url (git-dir relative-file-name git-branch line-number-part)
  (if relative-file-name
      (let* ((default-directory git-dir)
             (git-remote-url (stash/git-remote-url git-dir)))
        (stash/add-file-path-branch-and-line-number
         (stash/base-url-from-remote git-remote-url) relative-file-name git-branch line-number-part))
    (error "Argument relative-file-name was nil")))

(defun stash/line-number-part ()
  (if (use-region-p)
      (format "%s-%s" (line-number-at-pos (region-beginning)) (line-number-at-pos (region-end)))
    (line-number-at-pos)))

(defun stash/browse-to-buffer-file ()
  "Browse to the current buffers file in Atlassian Stash. Assumes
that the file is in a git repo where the `origin' git remote
points to a Stash instance."
  (interactive)
  (let* ((git-dir (file-truename (vc-root-dir)))
         (git-branch (stash/git-current-branch git-dir))
         (relative-file-name (file-relative-name (buffer-file-name) git-dir))
         (line-number-part (stash/line-number-part)))
    (browse-url (stash/create-stash-file-url git-dir relative-file-name git-branch line-number-part))))

(defun stash/buffer-file-url-to-clipboard ()
  "Copy the url to browse to the current buffers file in
Atlassian Stash. Assumes that the file is in a git repo where the
`origin' git remote points to a Stash instance."
  (interactive)
  (let* ((git-dir (file-truename (vc-root-dir)))
         (git-branch (stash/git-current-branch git-dir))
         (relative-file-name (file-relative-name (buffer-file-name) git-dir))
         (line-number-part (stash/line-number-part)))
    (kill-new (stash/create-stash-file-url git-dir relative-file-name git-branch line-number-part))))

(provide 'atlassian-stash)
