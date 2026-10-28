;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-magit--highlight-markers)

;;;###autoload
(defun hpb-magit--highlight-markers-font-lock ()
	"Highlight leading `token!' markers of the commit summary in `git-commit-mode'.
Intended for `git-commit-setup-hook'."
	(font-lock-add-keywords
		nil
		`((,hpb-magit--highlight-markers--lookup-rx (0 'magit-keyword-squash t)))
		'append
	)
)

(provide 'hpb-magit--highlight-markers-font-lock)
