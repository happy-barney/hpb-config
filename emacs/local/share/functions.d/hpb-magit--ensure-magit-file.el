;; -*- Mode: Emacs-Lisp -*-

(require 'magit)

;;;###autoload
(defun hpb-magit--ensure-magit-file ()
	"Return file name of the current buffer relative to its git repository,
signal `user-error' when buffer is not visiting a file or the file is not
in a git repository.
See `hpb-buffer--ensure-file'."
	(or (magit-file-relative-name (hpb-buffer--ensure-file))
		(user-error "Not in git repository")
	)
)

(provide 'hpb-magit--ensure-magit-file)
