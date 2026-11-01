;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--switch (&optional arg)
	"Switch to buffer (see `switch-to-buffer').
With prefix ARG open buffer menu instead (see `ibuffer')."
	(interactive "P")

	(if arg
		(hpb-buffer--list)
		(call-interactively #'switch-to-buffer)
	)
)

(provide 'hpb-buffer--switch)
