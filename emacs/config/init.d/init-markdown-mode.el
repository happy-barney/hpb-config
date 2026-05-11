
(use-package markdown-mode
	:ensure t

	:bind (
		:map markdown-mode-map
		("C-<return>" . 'markdown-follow-thing-at-point)
	)
)
