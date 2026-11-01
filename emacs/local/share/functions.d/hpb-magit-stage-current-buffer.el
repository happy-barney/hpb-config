
(require 'magit-apply)

(defun hpb-magit-stage-current-buffer ()
	(interactive)

	(hpb-buffer--ensure-file-exists)

	(let ((file (hpb-magit--ensure-magit-file)))
		(magit-stage-file file)
		(message (format "Stage %s" file))
	)
)

(provide 'hpb-magit-stage-current-buffer)
