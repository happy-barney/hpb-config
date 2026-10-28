;;; -*- Mode: Emacs-Lisp -*-

(require 'magit)

(defconst hpb-magit--highlight-markers--lookup-rx
	(rx
		bos
		(+
			(* space)
			(+ (any alpha "_" "-"))
			"!"
			(opt ":")
		)
	)
)

;;;###autoload
(defun hpb-magit--highlight-markers ()
	"Highlight leading `token!' markers (each with optional colon) of a commit summary.
Intended for `magit-log-wash-summary-hook' and `magit-revision-wash-message-hook'."
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
