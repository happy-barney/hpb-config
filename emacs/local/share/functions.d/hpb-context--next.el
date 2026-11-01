;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-context--next (&optional last)
	"Move to the next item of the current context (see `hpb-context--navigation-alist').
With prefix argument LAST move to the last item instead."
	(interactive "P")

	(let ((navigation (hpb-context--navigation)) (current-prefix-arg nil))
		(if (not last)
			(call-interactively (cadr navigation))
			(let ((origin (point)))
				(goto-char (point-max))
				(condition-case err
					(call-interactively (car navigation))
					(error (goto-char origin) (signal (car err) (cdr err)))
				)
			)
		)
	)
)

(provide 'hpb-context--next)
