;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-buffer--coding-system-cycle '(utf-8-unix utf-8-dos iso-latin-1-unix)
	"Coding systems cycled by `hpb-buffer--cycle-coding-system'."
)

;;;###autoload
(defun hpb-buffer--cycle-coding-system ()
	"Set `buffer-file-coding-system' to the next one from `hpb-buffer--coding-system-cycle'.
Starts from the first one when the current coding system is not in the list."
	(interactive)

	(let* (
			(tail (memq buffer-file-coding-system hpb-buffer--coding-system-cycle))
			(next (or (cadr tail) (car hpb-buffer--coding-system-cycle)))
		)
		(set-buffer-file-coding-system next)
		(message "Coding system: %s" next)
	)
)

(provide 'hpb-buffer--cycle-coding-system)
