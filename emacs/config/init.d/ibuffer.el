

(add-hook 'ibuffer-hook
		  (lambda ()
			(ibuffer-vc-set-filter-groups-by-vc-root)
			(unless (eq ibuffer-sorting-mode 'alphabetic)
			  (ibuffer-do-sort-by-alphabetic))))

;;
;; Alternatively, use `ibuffer-vc-generate-filter-groups-by-vc-root'
;; to programmatically obtain a list of filter groups that you can
;; combine with your own custom groups.
;;
;; To include vc status info in the ibuffer list, add either
;; vc-status-mini or vc-status to `ibuffer-formats':
;;


(setq ibuffer-formats
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
