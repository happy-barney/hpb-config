;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defvar hpb-magit--keymap
	(hpb-keymap--define-sparse-map
		'(
			("g"   . 'magit-status)
			("b"   . 'magit-branch-popup)
			("y"   . 'magit-show-refs-popup)
			("z"   . 'magit-stash-popup)
			("s t" . 'magit-status)
			("c o" . 'magit-checkout)
			("f f" . 'magit-find-file)
			("l l" . 'magit-log-current)
			(". a" . 'hpb-magit--stage-current-buffer)
			(". b" . 'magit-blame)
			(". B" . 'magit-blame-quit)
			(". e" . 'magit-ediff-compare)
			(". E" . 'magit-ediff-stage)
			(". l" . 'magit-log-buffer-file)
			(". y" . 'magit-show-refs-popup)
			(". z" . 'magit-stash-popup)
		)
	)
)
