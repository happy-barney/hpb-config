;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defvar hpb-text--keymap
	(hpb-keymap--define-sparse-map '(
		("s" . (hpb-keymap--require 'hpb-text--sort-keymap))
	))
)
