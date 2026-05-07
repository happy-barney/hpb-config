
(use-package yaml-mode
    :ensure t

	:mode
		("\\.ya?ml\\'" . yaml-mode)

	:hook
		(yaml-mode . viper-change-state-to-vi)
		(yaml-mode . hpb-yaml--outline-hook)
)

(provide 'hpb-setup--yaml)
