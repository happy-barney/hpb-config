;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-text--keymap
	(hpb-keymap--define-sparse-map '(
		("s" . (hpb-keymap--require 'hpb-text--sort-keymap))
		("% (" . 'hpb-parens--set)
		("% )" . 'hpb-parens--set)
		("% [" . 'hpb-parens--set)
		("% ]" . 'hpb-parens--set)
		("% {" . 'hpb-parens--set)
		("% }" . 'hpb-parens--set)
		("% <" . 'hpb-parens--set)
		("% >" . 'hpb-parens--set)
	))
)
