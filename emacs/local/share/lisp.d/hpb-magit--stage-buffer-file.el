
;;;###autoload
(defun hpb-magit--stage-buffer-file ()
	(interactive)

	(unless buffer-file-name
		(user-error "Not visiting a file")
	)
	(magit-file-stage)
	(message (concat "Stage " (magit-file-relative-name buffer-file-name)))
)

(provide 'hpb-magit--stage-buffer-file)
