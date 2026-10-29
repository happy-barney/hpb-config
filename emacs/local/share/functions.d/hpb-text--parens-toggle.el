;;; -*- Mode: Emacs-Lisp -*-

;; inspired by: https://emacs.stackexchange.com/a/37697

(require 'paren)

(defvar hpb-text--parens-toggle--cycle
	'(
		(?\( . "{}")
		(?\{ . "[]")
		(?\[ . "()")
	)
	"Alist mapping an opening paren character to the pair that replaces it."
)

;;;###autoload
(defun hpb-text--parens-toggle (&optional pair)
	"Toggle parens () {} [] at cursor.

When PAIR (a two character string such as \"[]\") is given, the parens
are replaced by it. Otherwise the replacement is looked up in
`hpb-text--parens-toggle--cycle'.
"
	(interactive)
	(let*
		(
			(parens (or (funcall show-paren-data-function) (user-error "No parens at point")))
			(here (nth 0 parens))
			(there (nth 2 parens))
			(start (min here there))
			(end (max here there))
			(replace-with (or pair (cdr (assq (char-after start) hpb-text--parens-toggle--cycle))))
		)
		(when replace-with
			(save-excursion
				(goto-char end)
				(delete-char 1)
				(insert (substring replace-with 1 2))
				(goto-char start)
				(delete-char 1)
				(insert (substring replace-with 0 1))
			)
		)
	)
)

(provide 'hpb-text--parens-toggle)
