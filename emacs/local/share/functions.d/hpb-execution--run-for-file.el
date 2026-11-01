;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-execution--run-for-file (command directory)
	"Run COMMAND for the file visited by the current buffer.
When COMMAND is a string, format it with shell quoted file name and run it
in DIRECTORY (see `compile'), otherwise call COMMAND interactively."
	(if (stringp command)
		(let*
			(
				(file (hpb-buffer--ensure-file-exists))
				(default-directory (file-name-as-directory directory))
			)
			(compile (format command (shell-quote-argument file)))
		)
		(call-interactively command)
	)
)

(provide 'hpb-execution--run-for-file)
