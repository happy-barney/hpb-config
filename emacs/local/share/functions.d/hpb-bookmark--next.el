;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-bookmark--next ()
	"Move to the next bookmark in the current buffer (see `hpb-bookmark--buffer-positions')."
	(interactive)

	(goto-char
		(or (seq-find (lambda (position) (> position (point))) (hpb-bookmark--buffer-positions))
			(user-error "No next bookmark")
		)
	)
)

(provide 'hpb-bookmark--next)
