;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-execution--test-file-alist
	'(
		(perl-mode          . "prove -lv %s")
		(cperl-mode         . "prove -lv %s")
		(python-mode        . "python3 -m pytest %s")
		(js-mode            . "node --test %s")
	)
	"Test file commands, list of (MODE . COMMAND), see `hpb-execution--run-for-file'.")

;;;###autoload
(defun hpb-execution--test-file ()
	"Run tests of the file visited by the current buffer (see `hpb-execution--test-file-alist').
Tests run in project root (see `hpb-project--project-root'), if any."
	(interactive)

	(hpb-execution--run-for-file
		(or (hpb-execution--mode-command hpb-execution--test-file-alist)
			(user-error "No test command for %s" major-mode)
		)
		(or (hpb-project--project-root) default-directory)
	)
)

(provide 'hpb-execution--test-file)
