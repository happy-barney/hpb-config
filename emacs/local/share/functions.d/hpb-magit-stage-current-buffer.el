
(require 'magit-apply)

(defun hpb-magit-stage-current-buffer ()
  (interactive)
  (let* ((file (hpb-buffer--ensure-file-exists)))
    (magit-stage-file file)
    (message (concat "Stage " (magit-file-relative-name file)))
    )
  )

(provide 'hpb-magit-stage-current-buffer)
