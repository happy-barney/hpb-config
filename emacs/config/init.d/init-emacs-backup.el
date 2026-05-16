
(use-package emacs
	:custom
		(backup-by-copying                  t)
		(backup-by-copying-when-linked      t)
		(backup-by-copying-when-mismatch    t)
		(backup-directory-alist             '((".*" . "~/.cache/emacs/backup.d/")))
		(delete-old-versions                t)
		(kept-new-versions                  10)
		(kept-old-versions                  10)
		(make-backup-files                  t)
		(vc-make-backup-files               nil)
		(version-control                    t)
)
