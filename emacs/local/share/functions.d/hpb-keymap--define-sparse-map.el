;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--define-sparse-map (&optional bindings)
	"Create sparse keymap with BINDINGS.
BINDINGS is list of (kbd-param . symbol).
Symbol is eval-ed, so has to be quoted.
Returns the created keymap.
See also `hpb-keymap--define-key'."

	(let ( (key-map (make-sparse-keymap)) )
		(mapcar (lambda (def) (define-key key-map (kbd (car def)) (eval (cdr def)))) bindings)
		key-map
	)
)
