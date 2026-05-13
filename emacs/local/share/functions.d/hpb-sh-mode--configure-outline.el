
;;;###autoload
(defun hpb-sh-mode--configure-outline ()
	(setq outline-level  'hpb-sh-mode--outline-level)
	(setq outline-regexp  hpb-sh-mode--outline-regex)
)

