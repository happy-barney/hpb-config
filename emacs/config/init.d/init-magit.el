
(use-package magit
	:ensure t

	:hook (
		(git-commit-setup            . git-commit-turn-on-flyspell)
		(magit-log-wash-summary      . hpb-magit--highlight-markers)
		(magit-revision-wash-summary . hpb-magit--highlight-markers)
	)
)
