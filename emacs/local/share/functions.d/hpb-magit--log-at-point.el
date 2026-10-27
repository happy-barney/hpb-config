;;; -*- Mode: Emacs-Lisp -*-

(require 'magit-log)

;;;###autoload
(defun hpb-magit--log-at-point ()
	"Show log of the reference or revision at point.
Works in the buffers where `magit-branch-or-commit-at-point' finds
something: `magit-show-refs', `magit-reflog-current', log, `magit-blame'.
Prompts for the revision (like `magit-log-other') when there is none."
	(interactive)
	(let ((rev (magit-branch-or-commit-at-point)))
		(if rev
			(pcase-let ((`(,args ,files) (magit-log-arguments)))
				(magit-log-other (list rev) args files)
			)
;			(call-interactively #'magit-log-other)
		)
	)
)

(provide 'hpb-magit--log-at-point)
