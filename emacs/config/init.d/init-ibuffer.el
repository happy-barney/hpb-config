
(defconst init-ibuffer--format
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              vc-relative-file)))

(use-package ibuffer
	:hook (
		(ibuffer . ibuffer-vc-set-filter-groups-by-vc-root)
;		(ibuffer . ibuffer-do-sort-by-alphabetic)
	)

	:custom
		(ibuffer-formats  init-ibuffer--format)
)
