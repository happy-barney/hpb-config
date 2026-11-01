;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-execution--execute ()
	"Execute the file visited by the current buffer (see `compile').
Executable file is executed directly, otherwise using interpreter from its
shebang line (see `hpb-buffer--shebang')."
	(interactive)

	(let ((file (hpb-buffer--ensure-file-exists)))
		(hpb-execution--run-for-file
			(cond
				((file-executable-p file) "%s")
				((hpb-buffer--shebang) (concat (hpb-buffer--shebang) " %s"))
				(t (user-error "File %s is not executable" file))
			)
			default-directory
		)
	)
)

(provide 'hpb-execution--execute)
