;;; -*- Mode: Emacs-Lisp -*-

(require 'helm-projectile)

(use-package projectile
	:ensure t
	:config
	(editorconfig-mode 1)
	(custom-set-variables
		'(projectile-enable-caching t)
		'(projectile-switch-project-action 'projectile-vc)
	)
	(projectile-mode)
)


