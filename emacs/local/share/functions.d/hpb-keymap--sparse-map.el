;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--sparse-map (&optional bindings)
	"Create sparse keymap with BINDINGS.
BINDINGS is list of (kbd-param . symbol).
Symbol is eval-ed, so has to be quoted.
Returns the created keymap.
See also `hpb-define-key'."

	(let ( (key-map (make-sparse-keymap)) )
		(dolist (def bindings)
			(define-key key-map (kbd (car def)) (eval (cdr def)))
		)
		key-map
	)
)

(provide 'hpb-keymap--sparse-map)
