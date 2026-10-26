;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--project-root ()
	"Return root directory of the current project, nil when there is none.
Uses projectile's project root, if projectile is available and knows the
project, otherwise the git top directory, if magit is available."
	(cond
		((and (fboundp 'projectile-project-root) (projectile-project-root)))
		((and (fboundp 'magit-toplevel) (magit-toplevel)))
	)
)

(provide 'hpb-project--project-root)
