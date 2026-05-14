;;; -*- Mode: Emacs-Lisp -*-

(use-package helm-projectile
	:ensure t

	:after (
		helm
		projectile
	)

	:bind (
		:map        projectile-command-map
		("s h"      . #'helm-projectile-ack)
		("f h"      . #'helm-projectile-find-file)
		("F h"      . #'helm-projectile-find-file-in-known-projects)
	)

	:config
		(helm-projectile-on)
)

(provide 'hpb-init--helm-projectile)

(require 'hpb-init--projectile)
