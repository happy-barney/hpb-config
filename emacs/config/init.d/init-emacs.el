
(require 'outline)
(require 'minibuf-electric-gnuemacs)

(use-package emacs
	:init
		(server-start)

	:custom
		(mouse-wheel-mode   t)
		(ring-bell-function ignore)
		(tab-width          4)
		(use-short-anwsers  t)
)
