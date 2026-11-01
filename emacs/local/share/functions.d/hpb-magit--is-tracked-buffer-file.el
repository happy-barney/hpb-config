;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-magit--is-tracked-buffer-file ()
	"Return non-nil when the file visited by the current buffer is tracked by git."
	(and buffer-file-name
		(magit-toplevel)
		(magit-file-tracked-p buffer-file-name)
	)
)

(provide 'hpb-magit--is-tracked-buffer-file)
