;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--enable-index ()
	"Add imenu index to the menu bar of the current buffer."
	(imenu-add-menubar-index)
)

(provide 'hpb-hook--enable-index)
