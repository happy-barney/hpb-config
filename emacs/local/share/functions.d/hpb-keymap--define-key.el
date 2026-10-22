;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--define-key (key-map bindings)
	"Define BINDINGS in keymap named by symbol KEY-MAP.
KEY-MAP is a symbol (quoted), not the keymap itself. When it is not bound
yet, a message is shown and nothing is defined.
BINDINGS is list of (kbd-param . symbol).
Symbol is eval-ed, so has to be quoted.
See also `hpb-keymap--sparse-map'."

	(if (boundp key-map)
		(dolist (def bindings)
			(define-key (symbol-value key-map) (kbd (car def)) (eval (cdr def)))
		)
		(message "hpb-keymap--define-key: keymap %s is not defined, skipping bindings" key-map)
	)
)

(provide 'hpb-keymap--define-key)
