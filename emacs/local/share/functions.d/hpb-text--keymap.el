;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-text--keymap
	(hpb-keymap--sparse-map '(
		("s" . (hpb-keymap--require 'hpb-text--keymap-sort))
	))
	"Keymap with text commands (bound to prefix in `global-map')."
)

(provide 'hpb-text--keymap)
