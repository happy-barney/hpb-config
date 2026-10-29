;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-text--self-insert (&optional skip-pair)
	"Insert the character corresponding to the key pressed,
stripping the control modifier. E.g., C-; inserts ';', C-[ inserts '['.
This uses the last key event to determine which character to insert.

Use universal argument to skip pair logic and just insert the character.

When inserted character is paired character (see 'insert-pair-alist'),
it inserts both start and end characters. In case region is active, it
wraps it with start and end characters.
"

	(interactive "P")
	(let* ((basic-char (event-basic-type last-command-event)))
		(if (characterp basic-char)
			(let* (
					(pair
						(if skip-pair
							(list basic-char)
							(or
								(assq  basic-char insert-pair-alist)
								(rassq basic-char insert-pair-alist)
								(list basic-char)
							)
						)
					)
					(start-char
						(car pair)
					)
					(end-char
						(cadr pair)
					)
					(start-char-insert-point
						(if (use-region-p)
							(region-beginning)
							(point))
					)
					(should-insert-space
						(and parens-require-spaces
							 end-char
							 (> start-char-insert-point (point-min))
							 (progn
								(goto-char start-char-insert-point)
								(let (
									 	(prev-char (char-before))
									)
									(and
										(not (memq prev-char '(?\s ?\t ?\n)))
										(not (assq prev-char insert-pair-alist))
									)
								)
							)
						)
					)
					(end-char-insert-point
						(if end-char
							(if (use-region-p)
								(region-end)
								(point))
							nil)
					)
				)
				;; Insert end-char first (if needed)
				(when end-char-insert-point
					(goto-char end-char-insert-point)
					(insert (char-to-string end-char))
				)

				;; Go to start position and insert space if needed
				(goto-char start-char-insert-point)
				(when should-insert-space
					(insert " ")
				)

				;; Insert start-char and position cursor after it
				(insert (char-to-string start-char))
			)
		)
	)
	(message nil)
)

