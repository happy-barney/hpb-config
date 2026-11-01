;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--switch-buffer (&optional arg)
	"Switch to project buffer (see `projectile-switch-to-buffer').
With prefix ARG open project buffer menu instead (see `projectile-ibuffer').
Outside of project behaves like `hpb-buffer--switch'."
	(interactive "P")

	(cond
		((not (hpb-project--project-root)) (hpb-buffer--switch arg))
		(arg (projectile-ibuffer nil))
		(t (projectile-switch-to-buffer))
	)
)

(provide 'hpb-project--switch-buffer)
