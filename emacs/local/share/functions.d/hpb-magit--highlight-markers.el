
;;;###autoload
(defun hpb-magit--highlight-markers ()
	(when
		(looking-at "\\`[a-zA-Z_][-a-zA-Z_]+[a-zA-Z_]! ")
		(magit--add-face-text-property
			(match-beginning 0)
			(match-end 0)
			'magit-keyword-squash
		)
	)
)

(provide 'hpb-magit--highlight-markers)
