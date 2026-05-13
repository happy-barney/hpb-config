;;; -*- Mode: Emacs-Lisp -*-

(use-package ruby-mode
	:hook (
		(ruby-mode . viper-change-state-to-vi)
	)
)

(provide 'hpb-init--ruby-mode)
