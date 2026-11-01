;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)
(require 'compile)

;;;###autoload (autoload 'hpb-transient--execution "hpb-transient--execution" nil t)
(transient-define-prefix hpb-transient--execution ()
	"Transient menu with execution management."
	[
		[
			"Compile"
			("<f9>" "recompile"           recompile)
			("c"   "compile"              compile)
			("C"   "set compile command"  hpb-execution--set-compile-command)
		]
		[
			"File"
			("s"   "syntax check"         hpb-execution--syntax-check)
			("x"   "execute"              hpb-execution--execute          :if hpb-buffer--is-executable)
			("t"   "test file"            hpb-execution--test-file)
		]
		[
			"Shell"
			("o"   "open shell"           hpb-execution--shell)
			("O"   hpb-execution--cycle-shell-type
				:description (lambda () (format "shell type: %s" hpb-execution--shell-type))
				:transient t
			)
		]
	]
)

(provide 'hpb-transient--execution)
