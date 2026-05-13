;;; -*- Mode: Emacs-Lisp -*-

(use-package powerline
	:ensure t

	:custom
		(powerline-buffer-size-suffix  t)
		(powerline-default-separator   'arrow-fade)

	:config
		(setq-default mode-line-format (hpb-modeline--powerline-theme))
)

(provide 'hpb-init--modeline-powerline)
