;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-c--style-hook ()
	"Use CC Mode style \"hpb-c--style\" in the current buffer."
	(c-set-style (hpb-c--style))
)

(provide 'hpb-c--style-hook)
