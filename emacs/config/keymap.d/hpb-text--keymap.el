;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defvar hpb--text-edit-keymap
	(hpb-keymap--define-sparse-map '(
		("s" . hpb/text-sort-map)
	))
)
