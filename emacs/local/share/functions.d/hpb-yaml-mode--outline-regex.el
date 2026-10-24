;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-yaml-mode--outline-regex ()
	"Return `outline-regexp' for `yaml-mode'.
Matches a key line (optionally a list item, optionally with a quoted key)
which has no inline value, only an optional block scalar indicator (`>', `|')
or an anchor (`&name')."
	(rx
		bol
		(* "  ")
		(opt "- ")
		(or
			(seq ?\" (* (not ?\")) ?\")
			(* (any "a-zA-Z0-9_-"))
		)
		":"
		(* " ")
		(opt
			(or
				(any ">|")
				(seq "&" (* (any "a-zA-Z0-9_-")))
			)
		)
		eol
	)
)

(provide 'hpb-yaml-mode--outline-regex)
