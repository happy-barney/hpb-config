
(require 'outline)
(require 'minibuf-electric-gnuemacs)

(use-package emacs
	:init
		(fset 'yes-or-no-p 'y-or-n-p)
		(server-start)

	:custom
		(mouse-wheel-mode   t)
		(ring-bell-function 'ignore)
		(use-short-anwsers  t)
		(tab-width          4)
)
