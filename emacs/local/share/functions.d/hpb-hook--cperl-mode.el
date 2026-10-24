;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--cperl-mode ()
	(interactive)

	(hpb-hook--configure-outline)

	(hpb-hook--load-local-config)
)

