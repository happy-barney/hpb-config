;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-c--style ()
	"Define CC Mode style \"hpb\" (gnu with 4 spaces offsets).
Expects `cc-mode' to be loaded."
	"hpb-c--style"
)

(c-add-style (hpb-c--style) '("gnu"
	(c-basic-offset . 4)
	(c-offsets-alist
		(arglist-close     . 0)
		(arglist-intro     . 4)
		(brace-list-entry  . 0)
		(brace-list-intro  . 4)
		(case-label        . 4)
		(substatement-open . 0)
	)
))

(provide 'hpb-c--style)
