
(use-package typescript-mode
	:ensure t
	:pin melpa-stable
	:disable

	:custom
		(typescript-indent-level 2)

	:hook (
		(typescript-mode . hpb-hook-typescript-mode)
	)
)
