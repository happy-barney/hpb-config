
;;;###autoload
(defun hpb-project--project-root ()
	(when (fboundp 'projectile-project-root)
		(projectile-project-root)
	)
)

(provide 'hpb-project--project-root)
