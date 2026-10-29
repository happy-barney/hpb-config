;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-text--parens-toggle)

(defvar hpb-text--parens-set--pairs
	'(
		(?\( . "()")
		(?\) . "()")
		(?0 . "()")
		(?9 . "()")
		(?\[ . "[]")
		(?\] . "[]")
		(?\{ . "{}")
		(?\} . "{}")
	)
	"Alist mapping the key that invoked `hpb-text--parens-set' to a pair."
)

;;;###autoload
(defun hpb-text--parens-set ()
	"Replace parens at cursor by the pair selected by the invoking key.
The pair is looked up in `hpb-text--parens-set--pairs'."
	(interactive)
	(let
		(
			(pair (cdr (assq last-command-event hpb-text--parens-set--pairs)))
		)
		(unless pair
			(user-error "No pair bound to %s" (single-key-description last-command-event))
		)
		(hpb-text--parens-toggle pair)
	)
)

(provide 'hpb-text--parens-set)
