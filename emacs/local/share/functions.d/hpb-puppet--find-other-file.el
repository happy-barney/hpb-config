(require 'thingatpt)

;;;###autoload
(defun hpb-puppet--find-other-file ()
	(interactive)

	(let* (
		(candidate (thing-at-point 'symbol t))
		(file candidate)
        ;(file (concat (replace-regexp-in-string "::" "/" candidate) ".pp"))
        ;(location (concat
        ;           (hpb-puppet-guess-root-for file (buffer-file-name (current-buffer)))
        ;           "/"
        ;           file
        ;           ))
        )
    (message file)
    ;(find-file location)
    )
)
