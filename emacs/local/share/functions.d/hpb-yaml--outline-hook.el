
;;;###autoload
(defun hpb-yaml--outline-hook ()
	(outline-minor-mode)
	(setq outline-regexp "^\\([ ]\\{2\\}\\)*\\([-] \\)?\\([\"][^\"]*[\"]\\|[a-zA-Z0-9_-]*\\): *\\([>|]\\|&[a-zA-Z0-9_-]*\\)?$")
	(setq outline-level 'hpb-yaml--outline-level)
)

(provide 'hpb-yaml--outline-hook
