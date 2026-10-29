;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-text--keymap
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
		("s" . (hpb-keymap--require 'hpb-text--keymap-sort))
	))
	"Keymap with text commands (bound to prefix in `global-map')."
)

(provide 'hpb-text--keymap)
