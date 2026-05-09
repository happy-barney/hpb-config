;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-symbol (symbol)
	"Require SYMBOL and return SYMBOL."
	(require symbol)
	symbol
)
