;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-execution--mode-command (alist)
	"Return command for the current major mode from ALIST, list of (MODE . COMMAND).
First entry with MODE matching current major mode (see `derived-mode-p') wins."
	(cdr (seq-find (lambda (entry) (derived-mode-p (car entry))) alist))
)

(provide 'hpb-execution--mode-command)
