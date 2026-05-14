;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--switch-buffer ()
	(interactive)
	(if (hpb-project--project-root)
		(projectile-switch-to-buffer)
		(switch-to-buffer)
	)
)

(provide 'hpb-project--switch-buffer)
