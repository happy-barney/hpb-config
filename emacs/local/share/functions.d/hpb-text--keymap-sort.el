;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-define-key)
(require 'hpb-sort-lines-in-paragraph)

(defvar hpb-text--keymap-sort
	(hpb-keymap--sparse-map '(
		("l" . 'sort-lines)
		("p" . 'sort-paragraphs)
		("i" . 'hpb-sort-lines-in-paragraph)
	))
	"Keymap with text sorting commands."
)

(provide 'hpb-text--keymap-sort)
