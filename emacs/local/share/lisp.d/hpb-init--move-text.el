;;; -*- Mode: Emacs-Lisp -*-

(use-package move-text
	:ensure t
	:pin    melpa-stable

	:bind (
		("M-<up>"           . 'move-lines-up)
		("M-<down>"         . 'move-lines-down)
	)
)

(provide 'hpb-init--move-text)
