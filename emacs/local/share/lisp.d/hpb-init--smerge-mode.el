;;; -*- Mode: Emacs-Lisp -*-

(use-package smerge-mode
	:ensure nil

	:bind (
		:map smerge-mode-map
			("<f5>"  . #'hpb-smerge-extend)
			("<f6>"  . #'smerge-swap)
			("<f7>"  . #'smerge-prev)
			("<f8>"  . #'smerge-next)
			("<f9>"  . #'smerge-keep-upper)
			("<f10>" . #'smerge-keep-lower)
			("<f11>" . #'smerge-keep-all)
	)
)

(provide 'hpb-init--smerge-mode)
