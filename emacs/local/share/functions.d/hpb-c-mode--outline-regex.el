;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-c-mode--outline-regex ()
	"Return `outline-regexp' for `c-mode'.
Group 1 captures the leading whitespace, group 2 the first character
of the heading (preprocessor `#', identifier start, digit, `.' or `/')."
	(rx
		bol
		(group (* (any " \t")))                 ; indentation
		(group (any "#a-zA-Z0-9_./"))           ; heading start
	)
)

(provide 'hpb-c-mode--outline-regex)
