;;; -*- Mode: Emacs-Lisp -*-

(require 'minibuf-electric-gnuemacs)
(require 'outline)

(use-package emacs
	:init
		(fset 'yes-or-no-p 'y-or-n-p)
		(server-start)
		(hpb-emacs--configure-graphic-frame)

	:custom
		(mouse-wheel-mode   t)
		(ring-bell-function #'ignore)
		(tab-width          4)
		(use-short-answers  t)
)

(provide 'hpb-init--emacs)
