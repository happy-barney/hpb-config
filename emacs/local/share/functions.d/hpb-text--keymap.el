;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-init--string-inflection)

(defvar hpb-text--keymap
	(hpb-keymap--sparse-map '(
		("%" . (hpb-keymap--require 'hpb-text--keymap-parens))
		("i" . #'string-inflection-all-cycle)
		("k" . #'string-inflection-kebab-case)
		("s" . (hpb-keymap--require 'hpb-text--keymap-sort))
		("u" . #'string-inflection-underscore)
	))
	"Keymap with text commands (bound to prefix in `global-map')."
)

(provide 'hpb-text--keymap)
