;;; -*- Mode: Emacs-Lisp -*-

(use-package whitespace
	:ensure nil

	:bind (
		("C-x ~ SPC" . 'whitespace-mode)
	)
)

(provide 'hpb-init--whitespace)
