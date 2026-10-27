;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--stage-buffer-file ()
	"Stage the file visited by the current buffer."
	(interactive)

	(unless buffer-file-name
		(user-error "Not visiting a file")
	)

	(unless (magit-toplevel)
		(user-error "Not in git repository")
	)

	(magit-file-stage)
	(message "Stage %s" (magit-file-relative-name buffer-file-name))
)

(provide 'hpb-magit--stage-buffer-file)
