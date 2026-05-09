
(use-package magit
	:ensure t

	:hook (
		(git-commit-setup            . git-commit-turn-on-flyspell)
	)
)
