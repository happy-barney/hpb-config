;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--list-by-mode ()
	"Open buffer menu (see `ibuffer') with buffers in the current major mode."
	(interactive)

	(hpb-buffer--list :mode major-mode)
)

(provide 'hpb-buffer--list-by-mode)
