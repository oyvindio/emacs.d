(setq rename-file-buffers-alist
      '(("pom.xml" . "pom")
	("setup.py" . "setup")
	("Makefile" . "make")
	("__init__.py" . "pkg")
        ("finnbuild.json" . "finnbuild")
        ("bower.json" . "bower")))

(defun detect-and-rename-file-buffers ()
  (mapcar (lambda (acons)
	    (detect-and-rename-file-buffer (car acons) (cdr acons)))
	  rename-file-buffers-alist))

(defun detect-and-rename-file-buffer (filename buffer-suffix)
  (when (string= (buffer-name) filename)
    (let* ((folders (split-string (buffer-file-name) "/"))
	   (base-dir (car (last folders 2))))
      (rename-buffer (format "%s-%s" base-dir buffer-suffix)))))

(add-hook 'find-file-hook 'detect-and-rename-file-buffers)
