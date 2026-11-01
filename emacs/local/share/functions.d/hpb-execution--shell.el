;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-execution--shell-types '(eshell terminal)
	"Shell types available for `hpb-execution--shell'.")

(defvar hpb-execution--shell-type 'eshell
	"Shell type used by `hpb-execution--shell', one of `hpb-execution--shell-types'.")

(defvar hpb-execution--terminal-program "x-terminal-emulator"
	"System terminal program used by `hpb-execution--shell'.")

;;;###autoload
(defun hpb-execution--shell ()
	"Open shell (see `hpb-execution--shell-type') in the directory of the current buffer."
	(interactive)

	(let ((directory (expand-file-name default-directory)))
		(pcase hpb-execution--shell-type
			('eshell
				(let ((eshell-buffer-name (format "*eshell %s*" (abbreviate-file-name directory))))
					(eshell)
				)
			)
			('terminal
				(let ((default-directory directory))
					(start-process "terminal" nil hpb-execution--terminal-program)
				)
			)
		)
	)
)

;;;###autoload
(defun hpb-execution--cycle-shell-type ()
	"Switch to next shell type (see `hpb-execution--shell-types')."
	(interactive)

	(setq hpb-execution--shell-type
		(or (cadr (memq hpb-execution--shell-type hpb-execution--shell-types))
			(car hpb-execution--shell-types)
		)
	)
	(message "Shell type: %s" hpb-execution--shell-type)
)

(provide 'hpb-execution--shell)
