
(use-package magit
	:ensure t
	:defer  t

	:init
		(require 'hpb-magit--highlight-markers)

	:hook (
		(git-commit-setup            . git-commit-turn-on-flyspell)
		(magit-log-wash-summary      . hpb-magit--highlight-markers)
		(magit-revision-wash-summary . hpb-magit--highlight-markers)
	)
)

(provide 'hpb-setup--magit)
