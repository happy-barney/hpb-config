
(use-package powerline
	:ensure t
	;:commands (hpb-modeline--theme-powerline)

	:custom
		(powerline-buffer-size-suffix  t)
		(powerline-default-separator   'arrow-fade)

	:config
		(setq-default mode-line-format (hpb-modeline--theme-powerline))
)

(provide 'hpb-setup--powerline)
