;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-text--keymap-parens
	(hpb-keymap--sparse-map '(
		("%" . #'hpb-text--parens-toggle)
		("(" . #'hpb-text--parens-set)
		(")" . #'hpb-text--parens-set)
		("0" . #'hpb-text--parens-set)
		("9" . #'hpb-text--parens-set)
		("[" . #'hpb-text--parens-set)
		("]" . #'hpb-text--parens-set)
		("{" . #'hpb-text--parens-set)
		("}" . #'hpb-text--parens-set)
		("<" . #'hpb-text--parens-set)
		(">" . #'hpb-text--parens-set)
	))
	"Keymap to toggle parentheses"
)

(provide 'hpb-text--keymap-parens)
