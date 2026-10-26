;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-init--viper)

(use-package yaml-mode
	:ensure t
	:after viper

	:mode
		("\\.ya?ml\\'" . yaml-mode)

	:hook
		(yaml-mode . viper-change-state-to-vi)
		(yaml-mode . hpb-hook--configure-outline)
		(yaml-mode . hpb-hook--disable-indent-tabs-mode)
		(yaml-mode . hpb-hook--load-local-config)
)

(provide 'hpb-init--yaml-mode)
