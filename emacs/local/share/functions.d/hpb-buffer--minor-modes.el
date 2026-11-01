;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--minor-modes ()
	"Return sorted list of buffer-local minor modes active in the current buffer."
	(sort
		(seq-filter
			(lambda (mode)
				(and (fboundp mode)
					(boundp mode)
					(local-variable-p mode)
					(symbol-value mode)
				)
			)
			minor-mode-list
		)
		#'string<
	)
)

(provide 'hpb-buffer--minor-modes)
