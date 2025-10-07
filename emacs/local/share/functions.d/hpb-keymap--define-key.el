;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--define-key (key-map bindings)
	"Define bindings in KEY-MAP.
BINDINGS is list of (kbd-param . symbol).
Symbol is eval-ed, so has to be quoted.
See also `hpb-keymap--define-sparse-map'."

	(if (boundp key-map)
		(mapcar (lambda (def) (define-key (symbol-value key-map) (kbd (car def)) (eval (cdr def)))) bindings)
		(message "hpb-keymap--define-key: keymap %s is not defined, skipping bindings" key-map)
	)
)
