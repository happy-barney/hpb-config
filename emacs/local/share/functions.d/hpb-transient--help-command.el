;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)
(require 'help-fns+)

;;;###autoload (autoload 'hpb-transient--help-command "hpb-transient--help-command" nil t)
(transient-define-prefix hpb-transient--help-command ()
	"Transient menu with `help-command' and `help-fns+' bindings."
	[
		[
			"Describe"
			("c"   "command"              describe-command)
			("b"   "bindings"             describe-bindings)
			("B"   "buffer"               describe-buffer)
			("f"   "function"             describe-function)
			("k"   "key"                  describe-key)
			("K"   "keymap"               describe-keymap)
			("m"   "mode"                 describe-mode)
			("o"   "option"               describe-option)
			("P"   "package"              describe-package)
			("s"   "syntax"               describe-syntax)
			("v"   "variable"             describe-variable)
		]
		[
			"Language"
			("C"   "coding system"        describe-coding-system)
			("I"   "input method"         describe-input-method)
			("L"   "language environment" describe-language-environment)
		]
		[
			"Cursor"
			("="   "position"             (lambda () (interactive) (what-cursor-position t)))
		]
		[
			"Documentation"
			("i"   "info"                 info)
		]
	]
)

(provide 'hpb-transient--help-command)
