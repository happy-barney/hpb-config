;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-magit--keymap-file
	(hpb-keymap--sparse-map '(
		("a" . #'hpb-magit--stage-buffer-file)
		("b" . #'magit-blame)
		("B" . #'magit-blame-quit)
		("e" . #'magit-ediff-compare)
		("E" . #'magit-ediff-stage)
		("l" . #'magit-log-buffer-file)
		("y" . #'magit-show-refs)
		("z" . #'magit-stash)
	))
	"Keymap with magit commands working on current file (bound to `.' in `hpb-magit--keymap')."
)

(provide 'hpb-magit--keymap-file)
