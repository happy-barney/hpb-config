
;;;###autoload
(defun hpb-buffer--kill-current-buffer ()
	(interactive)
	(kill-buffer (current-buffer))
)
