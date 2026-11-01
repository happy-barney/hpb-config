;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--revert (&optional arg)
	"Revert the current buffer from its file (see `revert-buffer-quick').
With prefix ARG reinitialize the buffer's modes instead (see `normal-mode')."
	(interactive "P")

	(if arg
		(normal-mode)
		(revert-buffer-quick)
	)
)

(provide 'hpb-buffer--revert)
