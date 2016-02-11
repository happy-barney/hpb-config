;;; -*- Mode: Emacs-Lisp -*-

(require 'projectile)
(require 'helm-projectile)

(custom-set-variables
 '(projectile-enable-caching t)
 )

(projectile-global-mode)

(setq projectile-switch-project-action 'projectile-vc)


