;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-bookmark--previous ()
	"Move to the previous bookmark in the current buffer (see `hpb-bookmark--buffer-positions')."
	(interactive)

	(goto-char
		(or (seq-find (lambda (position) (< position (point))) (reverse (hpb-bookmark--buffer-positions)))
			(user-error "No previous bookmark")
		)
	)
)

(provide 'hpb-bookmark--previous)
