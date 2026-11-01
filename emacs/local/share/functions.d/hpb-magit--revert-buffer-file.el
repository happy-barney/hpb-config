;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--revert-buffer-file (&optional head)
	"Revert the file visited by the current buffer to its staged version.
With prefix argument HEAD reset it to HEAD instead
\(see `hpb-magit--reset-buffer-file')."
	(interactive "P")

	(hpb-buffer--ensure-file)

	(hpb-magit--ensure-magit-file)

	(if head
		(hpb-magit--reset-buffer-file)
		(let ((file (magit-file-relative-name)))
			(when (yes-or-no-p (format "Revert %s to staged version? " file))
				(magit-with-toplevel
					(magit-run-git "checkout" "--" file)
				)
				(revert-buffer t t t)
			)
		)
	)
)

(provide 'hpb-magit--revert-buffer-file)
