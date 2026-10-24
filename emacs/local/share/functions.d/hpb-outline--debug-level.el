;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-outline--debug-level ()
	"Show outline level of the current line and all match groups.
Calls `outline-level' of the current buffer at the beginning of the line
and reports the match groups it left behind (usually the ones of
`outline-regexp')."
	(interactive)
	(save-excursion
		(beginning-of-line)
		(let* (
			(level  (funcall outline-level))
			(groups (hpb-outline--debug-level--groups))
		)
			(message "Level: %S%s" level
				(mapconcat
					(lambda (group) (format "; [%d] %S" (car group) (cdr group)))
					groups
					""
				)
			)
		)
	)
)

(defun hpb-outline--debug-level--groups ()
	"Return alist (INDEX . STRING) of all groups of the last match.
Groups which did not participate in the match are shown as nil."
	(let ((count (1- (/ (length (match-data)) 2))))
		(mapcar
			(lambda (index) (cons index (match-string-no-properties index)))
			(number-sequence 0 count)
		)
	)
)

(provide 'hpb-outline--debug-level)
