;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--save ()
	"Save the current buffer.
When the visited file belongs to a project (see `hpb-project--project-root')
which is a git repository, stage the file as well."
	(interactive)

	(save-buffer)

	(if (hpb-buffer--is-magit-project)
		(magit-file-stage)
	)
)

(provide 'hpb-buffer--save)
