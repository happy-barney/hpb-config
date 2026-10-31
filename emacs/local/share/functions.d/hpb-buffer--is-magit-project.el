;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--is-magit-project ()
	"Return non-nil when the current buffer belongs to a project
\(see `hpb-project--project-root') which is a git repository."
	(and (hpb-project--project-root) (magit-toplevel))
)

(provide 'hpb-buffer--is-magit-project)
