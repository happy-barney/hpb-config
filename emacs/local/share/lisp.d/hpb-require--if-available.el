;;; -*- Mode: Emacs-Lisp -*-

(defun hpb-require--if-available (feature)
	"Require feature if available, return t if loaded, nil otherwise"
	(condition-case nil
		(progn
			(require feature)
			t
		)
		(error nil)
	)
)

(provide 'hpb-require--if-available)
