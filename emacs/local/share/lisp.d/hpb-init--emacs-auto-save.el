;;; -*- Mode: Emacs-Lisp -*-

(defcustom hpb-init--emacs-auto-save--directory "~/.cache/emacs/auto-save/"
	"Directory where all Emacs auto-save files are centralized."
	:type 'directory
)

(use-package emacs
	:init
		(make-directory hpb-init--emacs-auto-save--directory t)

	:custom
		(auto-save-default                  t)
		(auto-save-interval                 300)
		(auto-save-no-message               t)
		(auto-save-timeout                  60)
		(auto-save-list-file-prefix         (concat hpb-init--emacs-auto-save--directory ".saves-"))
		(auto-save-file-name-transforms     `(
			(
				"\\`/[^/]*:\\([^/]*\\)/\\(?:.*/\\)*\\([^/]*\\)\\'"
				,(concat hpb-init--emacs-auto-save--directory "remote-\\1-\\2")
				t
			)
			(
				"\\`\\(?:.*/\\)*\\([^/]*\\)\\'"
				,(concat hpb-init--emacs-auto-save--directory "local-\\1")
				t
			)
		))
)

(provide 'hpb-init--emacs-auto-save)
