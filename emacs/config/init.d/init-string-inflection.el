;;; -*- Mode: Emacs-Lisp -*-

(use-package string-inflection
	:ensure t

	:bind (
		("C-c i i" . 'string-inflection-all-cycle)
		("C-c i k" . 'string-inflection-kebab-case)
		("C-c i u" . 'string-inflection-underscore)
		("C-c i %" . 'toggle-parens)
		("C-c i (" . 'toggle-parens-set-parens)
		("C-c i )" . 'toggle-parens-set-parens)
		("C-c i 0" . 'toggle-parens-set-parens)
		("C-c i 9" . 'toggle-parens-set-parens)
	)
)
