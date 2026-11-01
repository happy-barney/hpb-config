;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--ensure-file-exists ()
	"Return file name of the current buffer, signal `user-error' when buffer is not visiting
a file or the file does not exist.
See `hpb-buffer--ensure-file'."
	(let ((file (hpb-buffer--ensure-file)))
		(unless (file-exists-p file)
			(user-error "File %s does not exist" file)
		)
		file
	)
)

(provide 'hpb-buffer--ensure-file-exists)
