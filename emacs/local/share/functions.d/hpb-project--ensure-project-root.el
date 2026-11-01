;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--ensure-project-root ()
	"Return root directory of the current project, signal `user-error' when there is none.
See `hpb-project--project-root'."
	(or (hpb-project--project-root)
		(user-error "Not in project")
	)
)

(provide 'hpb-project--ensure-project-root)
