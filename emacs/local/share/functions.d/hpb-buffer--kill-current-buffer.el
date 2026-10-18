;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--kill-current-buffer ()
	(interactive)
	(kill-buffer (current-buffer))
)

(provide 'hpb-buffer--kill-current-buffer)
