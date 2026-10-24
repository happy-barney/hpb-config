;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--c-mode ()
	"Buffer local customizations of `c-mode'."
	(setq-local comment-column 41)
	(c-toggle-electric-state -1)
)

(provide 'hpb-hook--c-mode)
