(require 'atlassian-stash)

(ert-deftest test-base-url-from-remote-should-convert-ssh-url ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar")
        (actual (stash/base-url-from-remote "ssh://git@git.example.com:7999/foo/bar.git")))
    (should (equal actual expected))))

(ert-deftest test-base-url-from-remote-should-convert-ssh-url-with-http ()
  (let ((expected "http://git.example.com/projects/foo/repos/bar")
        (actual (stash/base-url-from-remote "ssh://git@git.example.com:7999/foo/bar.git" t)))
    (should (equal actual expected))))

(ert-deftest test-base-url-from-remote-should-convert-https-url ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar")
        (actual (stash/base-url-from-remote "https://user@git.example.com/scm/foo/bar.git")))
    (should (equal actual expected))))

(ert-deftest test-base-url-from-remote-should-convert-http-url ()
  (let ((expected "http://git.example.com/projects/foo/repos/bar")
        (actual (stash/base-url-from-remote "http://user@git.example.com/scm/foo/bar.git")))
    (should (equal actual expected))))

(ert-deftest test-base-url-from-remote-should-return-error-for-bogus-url ()
  (should-error (stash/base-url-from-remote "bogus foo bar")))

(ert-deftest test-add-file-path-branch-and-line-number-should-add-file-path ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar/browse/quux/quez.el")
        (actual (stash/add-file-path-branch-and-line-number "https://git.example.com/projects/foo/repos/bar"
                                                            "quux/quez.el")))
    (should (equal actual expected))))

(ert-deftest test-add-file-path-branch-and-line-number-should-add-file-path-and-git-branch ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar/browse/quux/quez.el?at=refs/heads/development")
        (actual (stash/add-file-path-branch-and-line-number "https://git.example.com/projects/foo/repos/bar"
                                                            "quux/quez.el" "refs/heads/development")))
    (should (equal actual expected))))

(ert-deftest test-add-file-path-branch-and-line-number-should-add-file-path-and-line-number ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar/browse/quux/quez.el#1337")
        (actual (stash/add-file-path-branch-and-line-number "https://git.example.com/projects/foo/repos/bar"
                                                            "quux/quez.el" nil 1337)))
    (should (equal actual expected))))

(ert-deftest test-add-file-path-branch-and-line-number-should-add-file-path-and-git-branch ()
  (let ((expected "https://git.example.com/projects/foo/repos/bar/browse/quux/quez.el?at=refs/heads/development#1337")
        (actual (stash/add-file-path-branch-and-line-number "https://git.example.com/projects/foo/repos/bar"
                                                            "quux/quez.el" "refs/heads/development" 1337)))
    (should (equal actual expected))))
