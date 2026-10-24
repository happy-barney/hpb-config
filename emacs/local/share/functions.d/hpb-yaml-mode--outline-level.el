;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-yaml-mode--outline-level ()
	"Return the outline level of the current line for `yaml-mode'.
Level is derived from indentation (hardcoded at 2 spaces), top level is 1.
See also `hpb-yaml-mode--outline-regex'."
	(1+ (/ (current-indentation) 2))
)

(provide 'hpb-yaml-mode--outline-level)
