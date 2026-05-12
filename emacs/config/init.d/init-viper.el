;;; Enable vi emulation using viper-mode

(use-package viper
	:ensure nil

	:init
		(setq viper-mode t)

	:bind (
		:map viper-vi-basic-map
		("DEL" . 'viper-delete-char)
		("z z" . 'viper-line-to-middle)
		("C-u" . 'universal-argument)
	)

	:custom
		(viper-repeat-from-history-key . nil)
)

