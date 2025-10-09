;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defvar hpb--text-edit-keymap
	(hpb-keymap--define-sparse-map '(
		("s" . hpb-text--sort-keymap)
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
