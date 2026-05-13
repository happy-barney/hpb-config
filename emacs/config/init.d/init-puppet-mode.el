
(use-package 'puppet-mode
	:ensure t
	:pin    melpa-stable
	:disabled

	:hook (
		(puppet-mode . viper-change-state-to-vi)
	)

	:bind (
		:map puppet-mode-map
		("C-c o f"   . hpb-puppet--find-other-file)
        ("C-c i m n" . hpb-puppet--insert-manifest-name)
	)
)
