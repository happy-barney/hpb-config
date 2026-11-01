;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--reset-buffer-file ()
	"Reset the file visited by the current buffer (both worktree and index) to HEAD."
	(interactive)

	(hpb-buffer--ensure-file)

	(hpb-magit--ensure-magit-file)

	(let ((file (magit-file-relative-name)))
		(when (yes-or-no-p (format "Reset %s to HEAD? " file))
			(magit-with-toplevel
				(magit-run-git "checkout" "HEAD" "--" file)
			)
			(revert-buffer t t t)
		)
	)
)

(provide 'hpb-magit--reset-buffer-file)
