;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-project--list-by-mode ()
	"Open buffer menu (see `ibuffer') with project buffers in the current major mode."
	(interactive)

	(hpb-buffer--list
		:mode       major-mode
		:project    (hpb-project--ensure-project-root)
	)
)

(provide 'hpb-project--list-by-mode)
