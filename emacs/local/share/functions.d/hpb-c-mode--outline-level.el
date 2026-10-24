;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-c-mode--outline-level ()
	"Return the outline level of the heading at point for `c-mode'.
The level is the width of the indentation, so top level declarations
get 0.  Lines which are not headings get 999.  Expects `outline-regexp'
to be the result of `hpb-c-mode--outline-regex' (group 1 indentation)."
	(if (looking-at outline-regexp)
		(string-width (match-string 1))
		999
	)
)

(provide 'hpb-c-mode--outline-level)
