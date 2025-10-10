;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-keymap--require (symbol)
	"Load keymap SYMBOL from ~/.config/emacs/keymap.d/ unless already defined.
Returns the value of SYMBOL after loading."
	(unless (boundp symbol)
		(let (
			(keymap-file
				(expand-file-name
							(concat (symbol-name symbol) ".el")
							"~/.config/emacs/keymap.d/")))
			(if (file-exists-p keymap-file)
				(load-file keymap-file)
				(error "Keymap file not found: %s" keymap-file))))
	(if (boundp symbol)
		(symbol-value symbol)
		(error "Symbol %s not defined after loading keymap file" symbol)))
