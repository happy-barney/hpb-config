;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--ensure-file ()
	"Return file name of the current buffer, signal `user-error' when buffer is not visiting a file."
	(or (buffer-file-name)
		(user-error "Buffer %s is not visiting a file" (buffer-name))
	)
)

(provide 'hpb-buffer--ensure-file)
