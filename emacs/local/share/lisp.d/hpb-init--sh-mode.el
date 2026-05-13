;;; -*- Mode: Emacs-Lisp -*-

(use-package sh-script
	:ensure nil

	:config
		(hpb-sh--config-index)

	:hook (
		(sh-mode . hpb-hook--configure-outline)
		(sh-mode . hpb-hook--enable-index)
		(sh-mode . hpb-hook--load-local-config)
	)
)

(provide 'hpb-init--sh-mode)
