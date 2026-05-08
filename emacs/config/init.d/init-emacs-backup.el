
(use-package emacs
	:custom
		(backup-by-copying                  t)
		(backup-by-copying-when-linked      t)
		(backup-by-copying-when-mismatch    t)
		(backup-directory-alist             '((".*" . "~/.cache/emacs/backup.d/")))
		(make-backup-files                  t)
		(version-control                    t)
)
