;;; -*- Mode: Emacs-Lisp -*-

(use-package git-commit
	:ensure nil
	:demand t

	:config
;		(add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
		(add-hook 'git-commit-setup-hook            #'hpb-magit--highlight-markers-font-lock)
		(add-hook 'magit-log-wash-summary-hook      #'hpb-magit--highlight-markers t)
		(add-hook 'magit-revision-wash-message-hook #'hpb-magit--highlight-markers t)
)

(provide 'hpb-init--magit)
