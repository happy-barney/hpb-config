;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--require (symbol)
	"Load module SYMBOL (for example `hpb-text--keymap') and return its keymap.
The module has to provide the feature SYMBOL and define the keymap variable
of the same name.
Signals an error when SYMBOL is not defined after loading."
	(require symbol)
	(if (boundp symbol)
		(symbol-value symbol)
		(error "Symbol %s not defined after loading module" symbol)
	)
)

(provide 'hpb-keymap--require)
