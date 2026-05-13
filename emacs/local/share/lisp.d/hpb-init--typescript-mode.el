;;; -*- Mode: Emacs-Lisp -*-

(use-package typescript-mode
	:ensure t
	:pin melpa-stable

	:custom
		(typescript-indent-level 2)

	:hook (
		(typescript-mode . hpb-hook-typescript-mode)
	)
)

(provide 'hpb-init--typescript-mode)
