;; -*- Mode: Emacs-Lisp -*-

(require 'files)
;(require 'subr)

;;;###autoload
(defun hpb-emacs--load-directory (&rest dirs)
	"Load all .el or .elc files from dir.
Directory may not exists and may not be expanded.
Files are not loaded recursively."

	(dolist (dir dirs)
		(when (file-directory-p dir)
			(let* (
				(files (directory-files dir t (rx ".el" (opt "c") line-end)))
				(files (mapcar #'file-name-sans-extension files))
				(files (delete-dups files))
				)
				;; Iterate over the cleaned list
				(dolist (file files)
					(condition-case err
						(load file nil t)
						(error (message "Problem loading %s: %s" file err))
					)
				)
			)
		)
	)
	t
)

(provide 'hpb-emacs--load-directory)

