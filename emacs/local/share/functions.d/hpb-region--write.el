;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-region--write (start end filename)
	"Write the region between START and END into FILENAME (see `write-region').
When FILENAME belongs to a project (see `hpb-project--project-root')
which is a git repository, stage the file as well."
	(interactive "r\nFWrite region to file: ")

	(write-region start end filename)

	(let ((default-directory (file-name-directory (expand-file-name filename))))
		(if (and (hpb-project--project-root) (magit-toplevel))
			(magit-stage-files (list (magit-file-relative-name filename)))
		)
	)
)

(provide 'hpb-region--write)
