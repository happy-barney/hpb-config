
(use-package smerge-mode
	:bind (
		:map smerge-mode-map
			("<f7>"  . #'smerge-prev)
			("<f8>"  . #'smerge-next)
			("<f9>"  . #'smerge-keep-upper)
			("<f10>" . #'smerge-keep-lower)
			("<f11>" . #'smerge-keep-all)
	)
)
