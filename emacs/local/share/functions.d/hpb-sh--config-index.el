;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-sh--config-index ()
	"Fix imenu function names of `sh-mode'.
Monkeypatch: the stock `sh' (and so `bash') expressions in
`sh-imenu-generic-expression' do not accept `-' in function names,
`function d-perl' is indexed as `d'.  Expects `sh-script' to be loaded."

	(let ((name (rx (group (any "a-zA-Z_") (* (any "a-zA-Z0-9_-"))))))
		(setf
			(alist-get 'sh sh-imenu-generic-expression)
			`(
				(nil
					;; function FOO
					;; function FOO()
					,(concat "^\\s-*function\\s-+" name "\\s-*\\(?:()\\)?")
					1
				)
				(nil
					;; FOO()
					,(concat "^\\s-*" name "\\s-*()")
					1
				)
			)
		)
	)
)

(provide 'hpb-sh--config-index)
