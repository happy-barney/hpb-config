;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--untrack-buffer-file ()
	"Untrack the file visited by the current buffer (see git rm --cached), keep the file."
	(interactive)

	(let ((file (hpb-magit--ensure-magit-file)))
		(unless (hpb-magit--is-tracked-buffer-file)
			(user-error "File %s is not tracked" file)
		)
		(when (yes-or-no-p (format "Untrack %s? " file))
			(magit-with-toplevel
				(magit-run-git "rm" "--cached" "--" file)
			)
			(message "Untrack %s" file)
		)
	)
)

(provide 'hpb-magit--untrack-buffer-file)
