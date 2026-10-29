;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-define-key)
(require 'string-inflection)

(defvar hpb-text--keymap-insert
	(hpb-keymap--sparse-map '(
		("[" . #'insert-pair)
		("{" . #'insert-pair)
		("\"" . #'insert-pair)
		("i" . #'string-inflection-all-cycle)
		("k" . #'string-inflection-kebab-case)
		("u" . #'string-inflection-underscore)
		("%" . #'toggle-parens)
		("(" . #'toggle-parens-set-parens)
		(")" . #'toggle-parens-set-parens)
		("0" . #'toggle-parens-set-parens)
		("9" . #'toggle-parens-set-parens)
	))
	"Keymap with text insert / modify commands."
)

(provide 'hpb-text--keymap-insert)
