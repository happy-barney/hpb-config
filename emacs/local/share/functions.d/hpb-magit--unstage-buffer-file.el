;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--unstage-buffer-file ()
	"Unstage the file visited by the current buffer."
	(interactive)

	(let ((file (hpb-magit--ensure-magit-file)))
		(magit-file-unstage)
		(message "Unstage %s" file)
	)
)

(provide 'hpb-magit--unstage-buffer-file)
