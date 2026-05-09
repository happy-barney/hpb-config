
(require 'ansi-color)

;;;###autoload
(defun hpb-ansi-color--colorize-buffer ()
	(let (
		(buffer-read-only nil)
		)
		(ansi-color-apply-on-region (point-min) (point-max))
	)
)
