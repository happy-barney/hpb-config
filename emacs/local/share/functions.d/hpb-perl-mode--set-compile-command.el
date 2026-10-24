;;; -*- Mode: Emacs-Lisp -*-

(defcustom hpb-perl-mode--perlbrew-with "gdc-el6@up-to-date"
	"Perlbrew environment used to compile (run) the current perl buffer."
	:type 'string
)

;;;###autoload
(defun hpb-perl-mode--set-compile-command ()
	"Set buffer local `compile-command' to run the visited file using perlbrew."
	(setq-local
		compile-command
		(concat "perlbrew exec --with " hpb-perl-mode--perlbrew-with " perl " buffer-file-name)
	)
)

(provide 'hpb-perl-mode--set-compile-command)
