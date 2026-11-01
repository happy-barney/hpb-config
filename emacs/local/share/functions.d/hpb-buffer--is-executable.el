;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--is-executable ()
	"Return non-nil when the file visited by the current buffer can be executed,
ie. it is executable or it has shebang line (see `hpb-buffer--shebang')."
	(and buffer-file-name
		(file-exists-p buffer-file-name)
		(or (file-executable-p buffer-file-name) (hpb-buffer--shebang))
	)
)

(provide 'hpb-buffer--is-executable)
