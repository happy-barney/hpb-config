;;; -*- Mode: Emacs-Lisp -*-

;;; Enable vi emulation using viper-mode

(use-package viper
	:ensure nil

	:init
		(setq viper-mode t)

	:custom
		(viper-repeat-from-history-key nil)

	:bind (
		:map        viper-vi-basic-map
		("DEL"      . 'viper-delete-char)
		("z z"      . 'viper-line-to-middle)
		("C-u"      . 'universal-argument)
	)
)

(provide 'hpb-init--viper)
