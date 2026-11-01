;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--kill-delete-file ()
	"Kill the current buffer and delete the file it is visiting."
	(interactive)
	(let (
			(filename (hpb-buffer--ensure-file))
		)
		(when (y-or-n-p (format "Delete %s? " filename))
			(when (kill-buffer)
				(delete-file filename)
				(message "Deleted file %s" filename)
			)
		)
	)
)

(provide 'hpb-buffer--kill-delete-file)
