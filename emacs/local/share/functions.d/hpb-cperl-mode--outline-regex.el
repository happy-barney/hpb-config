;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-cperl-mode--outline-regex ()
	"Return `outline-regexp' for `cperl-mode'.
Group 1 captures the leading whitespace, group 2 the heading itself
(pod directive, identifier start, quote, bracket, `=>' or `1'),
both are used by `hpb-cperl-mode--outline-level'."
	(rx
		bol
		(group (* (any " \t")))                 ; indentation
		(group
			(or
				(regexp "=\\w+")                ; POD headings (generic)
				(any "a-zA-Z_")                 ; identifier start
				(any "\"'\\$;[]})")             ; punctuation chars
				"=>"
				"1"
			)
		)
	)
)

(provide 'hpb-cperl-mode--outline-regex)
