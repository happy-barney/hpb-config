;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-execution--context-alist
	'(
		((lambda () (derived-mode-p 'compilation-mode))
			. recompile)
		((lambda () (and buffer-file-name (string-match-p "\\.t\\'" buffer-file-name)))
			. hpb-execution--test-file)
	)
	"Context execution, list of (PREDICATE . COMMAND).
First entry with PREDICATE returning non-nil in the current buffer provides
COMMAND (see `hpb-execution--context').")

;;;###autoload
(defun hpb-execution--context ()
	"Execute command of the current context (see `hpb-execution--context-alist').
Without matching context open `hpb-transient--execution'."
	(interactive)

	(call-interactively
		(or (cdr (seq-find (lambda (entry) (funcall (car entry))) hpb-execution--context-alist))
			#'hpb-transient--execution
		)
	)
)

(provide 'hpb-execution--context)
