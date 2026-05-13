
(use-package yasnippet
	:ensure t
	:pin melpa-stable

	:config
		(add-to-list 'yas-snippet-dirs "~/.local/share/emacs/yasnippet")

	:init
		(yas-global-mode 1)

	:bind (
		:map yas-minor-mode-map
		("<tab>"     . nil)
		("TAB"       . nil)
		("<backtab>" . nil)
		;("C-c SPC"   . 'yas-expand)
	)
)
