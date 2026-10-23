;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--disable-indent-tabs-mode ()
	"Make the current buffer indent with spaces only."
	(indent-tabs-mode -1)
)

(provide 'hpb-hook--disable-indent-tabs-mode)
