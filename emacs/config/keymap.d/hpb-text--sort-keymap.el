;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-text--sort-keymap
	(hpb-keymap--define-sparse-map '(
		("l" . 'sort-lines)
		("p" . 'sort-paragraphs)
		("i" . 'hpb-text--sort-paragraph-lines)
	))
)
