
;;;###autoload
(defun hpb-yaml--outline-level ()
	"Return the outline level based on the indentation, hardcoded at 2 spaces."
	(s-count-matches "[ ]\\{2\\}" (match-string 0))
)

(provide 'hpb-yaml--outline-level)
