;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-define-key)
(require 'string-inflection)

(defvar hpb-text--keymap-insert
	(hpb-keymap--sparse-map '(
		("("    . #'hpb-text--self-insert)
		("["    . #'hpb-text--self-insert)
		("{"    . #'hpb-text--self-insert)
		("\""   . #'hpb-text--self-insert)
		("'"    . #'hpb-text--self-insert)
		("i"    . #'string-inflection-all-cycle)
		("k"    . #'string-inflection-kebab-case)
		("u"    . #'string-inflection-underscore)
	))
	"Keymap with text insert / modify commands."
)

(provide 'hpb-text--keymap-insert)
