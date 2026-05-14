;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--project-root ()
	"Returns projectile's project root, if projectile is available; nil otherwise"
	(when (fboundp 'projectile-project-root)
		(projectile-project-root)
	)
)

(provide 'hpb-project--project-root)
