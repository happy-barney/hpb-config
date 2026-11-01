;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--kill-delete-file ()
	"Kill the current buffer and delete the file it is visiting.
When the file is tracked by git, remove it from git as well (see git rm)."
	(interactive)
	(let*
		(
			(filename (hpb-buffer--ensure-file))
			(tracked (hpb-magit--is-tracked-buffer-file))
			(toplevel (and tracked (magit-toplevel)))
			(relative (and tracked (magit-file-relative-name filename)))
		)
		(when (y-or-n-p (format "Delete %s%s? " filename (if tracked " (git rm)" "")))
			(when (kill-buffer)
				(if tracked
					(let ((default-directory toplevel))
						(magit-run-git "rm" "-f" "--" relative)
					)
					(delete-file filename)
				)
				(message "Deleted file %s" filename)
			)
		)
	)
)

(provide 'hpb-buffer--kill-delete-file)
