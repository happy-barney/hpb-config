;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-context--previous (&optional first)
	"Move to the previous item of the current context (see `hpb-context--navigation-alist').
With prefix argument FIRST move to the first item instead."
	(interactive "P")

	(let ((navigation (hpb-context--navigation)) (current-prefix-arg nil))
		(if (not first)
			(call-interactively (car navigation))
			(let ((origin (point)))
				(goto-char (point-min))
				(condition-case err
					(call-interactively (cadr navigation))
					(error (goto-char origin) (signal (car err) (cdr err)))
				)
			)
		)
	)
)

(provide 'hpb-context--previous)
