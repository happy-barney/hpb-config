
;;;###autoload
(defun hpb-puppet-insert-manifest-name ()
	(interactive)
	(insert (hpb-puppet-guess-manifest-name))
)

