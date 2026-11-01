;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-execution--syntax-check-alist
	'(
		(perl-mode          . "perl -c %s")
		(cperl-mode         . "perl -c %s")
		(sh-mode            . "bash -n %s")
		(python-mode        . "python3 -m py_compile %s")
		(ruby-mode          . "ruby -c %s")
		(js-json-mode       . "python3 -m json.tool %s > /dev/null")
		(js-mode            . "node --check %s")
		(emacs-lisp-mode    . check-parens)
	)
	"Syntax check commands, list of (MODE . COMMAND), see `hpb-execution--run-for-file'.")

;;;###autoload
(defun hpb-execution--syntax-check ()
	"Check syntax of the file visited by the current buffer (see `hpb-execution--syntax-check-alist')."
	(interactive)

	(hpb-execution--run-for-file
		(or (hpb-execution--mode-command hpb-execution--syntax-check-alist)
			(user-error "No syntax check for %s" major-mode)
		)
		default-directory
	)
)

(provide 'hpb-execution--syntax-check)
