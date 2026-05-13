
(use-package smerge-mode
	:bind (
		:map smerge-basic-map
			("s" . 'smerge-swap)
			("x" . 'hpb-smerge--extend)

		:map smerge-mode-map
			("<f5>"  . #'hpb-smerge--extend)
			("<f6>"  . #'smerge-swap)
			("<f7>"  . #'smerge-prev)
			("<f8>"  . #'smerge-next)
			("<f9>"  . #'smerge-keep-upper)
			("<f10>" . #'smerge-keep-lower)
			("<f11>" . #'smerge-keep-all)
	)
)
