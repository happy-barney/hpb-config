;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--stage-buffer-file ()
	"Stage the file visited by the current buffer."
	(interactive)

	(hpb-buffer--ensure-file)
	(hpb-magit--ensure-magit-file)

	(magit-file-stage)
	(message "Stage %s" (magit-file-relative-name buffer-file-name))
)

(provide 'hpb-magit--stage-buffer-file)
