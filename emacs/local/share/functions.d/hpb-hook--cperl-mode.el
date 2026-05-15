;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--cperl-mode ()
	(interactive)

	(outline-minor-mode t)

	(setq outline-regexp        (hpb-perl--outline-regexp))
	(setq outline-level        'hpb-perl--outline-level)

	(hpb-local-load-config "cperl-mode")
)

