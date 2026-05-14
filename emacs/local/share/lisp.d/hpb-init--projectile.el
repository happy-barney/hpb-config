;;; -*- Mode: Emacs-Lisp -*-

(use-package projectile
	:ensure t

	:bind (
		:map        projectile-command-map
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
		(projectile-project-search-path     '(
			("~/git/branch" . 1)
			("~/git/master" . 1)
			("~/git/master/perl-actions" . 1)
			("~/git/organisation" . 2)
			("~/git/work"   . 2)
		))

	:hook (
		(emacs-startup . projectile-cleanup-known-projects)
	)
)

(provide 'hpb-init--projectile)

(require 'hpb-init--helm-projectile)
