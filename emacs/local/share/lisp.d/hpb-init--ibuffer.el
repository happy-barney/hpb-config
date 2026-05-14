;;; -*- Mode: Emacs-Lisp -*-

(defconst hpb-init--ibuffer--format
	'(
		(
			mark modified read-only vc-status-mini " "
			(name 18 18 :left :elide) " "
			(size 9 -1 :right) " "
			(mode 16 16 :left :elide) " "
			(vc-status 16 16 :left) " "
			vc-relative-file
		)
	)
	"Value of `ibuffer-formats'."
)

(use-package ibuffer
	:custom
		(ibuffer-formats  hpb-init--ibuffer--format)

	:hook (
		(ibuffer . ibuffer-vc-set-filter-groups-by-vc-root)
	)
)

(provide 'hpb-init--ibuffer)
