;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--write ()
	"Write the current buffer into another file (see `write-file').
When the new file belongs to a project (see `hpb-project--project-root')
which is a git repository, stage the file as well."
	(interactive)

	(call-interactively #'write-file)

	(if (hpb-buffer--is-magit-project)
		(magit-file-stage)
	)
)

(provide 'hpb-buffer--write)
