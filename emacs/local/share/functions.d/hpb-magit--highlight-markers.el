;; -*- Mode: Emacs-Lisp -*-

(require 'magit)

(defconst hpb-magit--highlight-markers--lookup-rx
	(rx
		bos
		(opt (group-n 1
			(+
				(* space)
				(+ (any alpha "_" "-"))
				"!"
			)
		))
	)
)

;;;###autoload
(defun hpb-magit--highlight-markers ()
	(when
		(looking-at hpb-magit--highlight-markers--lookup-rx)
		(magit--add-face-text-property
			(match-beginning 0)
			(match-end 0)
			'magit-keyword-squash
		)
	)
)

(provide 'hpb-magit--highlight-markers)
