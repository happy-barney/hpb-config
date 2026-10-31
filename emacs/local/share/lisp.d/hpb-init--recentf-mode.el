;;; -*- Mode: Emacs-Lisp -*-

(use-package recentf
	:ensure nil

	:custom
		(recentf-save-file          "~/.cache/emacs/recentf")
		(recentf-max-saved-items    200)
		(recentf-mode               t)
)

(provide 'hpb-init--recentf-mode)
