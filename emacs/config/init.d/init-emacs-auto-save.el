;; -*- Mode: Emacs-Lisp -*-

(defcustom auto-save-directory "~/.cache/emacs/auto-save/"
	"Directory where all Emacs auto-save files are centralized."
	:type 'directory
	:group 'auto-save
)

(use-package emacs
	:init
		(make-directory auto-save-directory t)

	:custom
		(auto-save-default                  t)
		(auto-save-interval                 300)
		(auto-save-no-message               t)
		(auto-save-timeout                  60)
		(auto-save-list-file-prefix         ,(concat auto-save-directory ".saves-"))
		(auto-save-file-name-transforms     `(
			(
				,"\\`/[^/]*:\\([^/]*\\)/\\(?:.*/\\)*\\([^/]*\\)\\'"
				,(concat auto-save-directory "remote-\\1-\\2")
				t
			)
			(
				,"\\`\\(?:.*/\\)*\\([^/]*\\)\\'"
				,(concat auto-save-directory "local-\\1")
				t)
			)
		)
)
