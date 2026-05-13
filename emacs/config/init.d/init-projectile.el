;;; -*- Mode: Emacs-Lisp -*-

(use-package projectile
	:ensure t

	:bind (
		:map projectile-command-map
		("s"        . nil)
		("f"        . nil)
		("f p"      . #'projectile-find-file)
		("F"        . nil)
		("F p"      . #'projectile-find-file-in-known-projects)
	)

	:config
		(projectile-mode 1)

	:custom
		(projectile-completion-system       'helm)
		(projectile-enable-caching          t)
		(projectile-switch-project-action   'projectile-vc)
)

(use-package helm-projectile
	:ensure t

	:after (
		helm
		projectile
	)

	:bind (
		:map projectile-command-map
		("s h"      . #'helm-projectile-ack)
		("f h"      . #'helm-projectile-find-file)
		("F h"      . #'helm-projectile-find-file-in-known-projects)
	)

	:config
		(helm-projectile-on)
)

(provide 'hpb-setup--projectile)
