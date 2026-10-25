;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--load-local-config (&optional name)
	"Load buffer local configuration NAME, default is `major-mode'.
NAME is a symbol (for example `c-mode-common') or a string.
Searches files (silently skipping the missing ones):
 - ~/.config/emacs/local.d/NAME-local.el
 - ~/.config/emacs-local/local.d/NAME-local.el"
	(let (
		(name (cond
			((null name)    (symbol-name major-mode))
			((symbolp name) (symbol-name name))
			((stringp name) name)
			(t (signal 'wrong-type-argument (list 'symbol-or-string-p name)))
		))
	)
		(load (concat "~/.config/emacs/local.d/" name "-local.el") t)
		(load (concat "~/.config/emacs-local/local.d/" name "-local.el") t)
	)
)

(provide 'hpb-hook--load-local-config)
