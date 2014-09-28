(autoload 'js2-mode "js2-mode" "Start js2-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'moz-minor-mode)
(add-hook 'js2-mode-hook 'run-coding-hook)
(setq js2-basic-offset 2)

;; json in js2-mode hack
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defadvice js2-reparse (before json)
	(setq js2-buffer-file-name buffer-file-name))
(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
	(if (and (= tt js2-LC)
			js2-buffer-file-name
			(string-equal (substring js2-buffer-file-name -5) ".json")
			(eq (+ (save-excursion
						(goto-char (point-min))
						(back-to-indentation)
						(while (eolp)
							(next-line)
							(back-to-indentation))
						(point)) 1) js2-ts-cursor))
		(setq ad-return-value (js2-parse-assign-expr))
		ad-do-it))
(ad-activate 'js2-parse-statement)

(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

(provide 'js)
;;; starter-kit-js.el ends here
