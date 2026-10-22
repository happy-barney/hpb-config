;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-init--string-inflection)

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
		("i" . #'string-inflection-all-cycle)
		("k" . #'string-inflection-kebab-case)
		("s" . (hpb-keymap--require 'hpb-text--keymap-sort))
		("u" . #'string-inflection-underscore)
	))
	"Keymap with text commands (bound to prefix in `global-map')."
)

(provide 'hpb-text--keymap)
