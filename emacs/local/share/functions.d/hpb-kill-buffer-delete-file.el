
(defun hpb-kill-buffer-delete-file ()
  "Kill the current buffer and delete the file it is visiting."
  (interactive)
  (let ((filename (hpb-buffer--ensure-file)))
    (kill-buffer)
    (delete-file filename)
    (message "Deleted file %s" filename)
    ))

(provide 'hpb-kill-buffer-delete-file)
