;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-context--minor-modes
	'(
		smerge-mode
		outline-minor-mode
	)
	"Minor modes providing buffer context (see `hpb-context--disable').")

;;;###autoload
(defun hpb-context--disable ()
	"Disable all context minor modes (see `hpb-context--minor-modes') in the current buffer."
	(interactive)

	(let ((disabled (seq-filter (lambda (mode) (and (boundp mode) (symbol-value mode))) hpb-context--minor-modes)))
		(dolist (mode disabled)
			(funcall mode -1)
		)
		(message "Disabled: %s" (if disabled (mapconcat #'symbol-name disabled ", ") "nothing"))
	)
)

(provide 'hpb-context--disable)
