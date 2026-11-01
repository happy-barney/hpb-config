;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-execution--set-compile-command (command)
	"Set buffer local `compile-command' to COMMAND."
	(interactive (list (read-shell-command "Compile command: " compile-command)))

	(setq-local compile-command command)
)

(provide 'hpb-execution--set-compile-command)
