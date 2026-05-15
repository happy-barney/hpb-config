
(use-package desktop
	:ensure nil

	:custom
		(desktop-auto-save-timeout  300)
		(desktop-base-file-name     "emacs.desktop")
		(desktop-base-lock-name     "emacs.desktop.lock")
		(desktop-path               '("~/.cache/emacs/"))
		(desktop-save-mode          t)
)
