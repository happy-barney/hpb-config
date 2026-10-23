;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--kill-delete-file ()
	"Kill the current buffer and delete the file it is visiting."
	(interactive)
	(let ( (filename (buffer-file-name)) )
		(unless filename
			(user-error "Buffer is not visiting a file")
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
