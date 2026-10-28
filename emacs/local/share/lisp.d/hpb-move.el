;;; -*- Mode: Emacs-Lisp -*-
;;; Idea taken from XEmacs simple.el

(defcustom hpb-move--block-movement-size 6
	"Number of lines moved by \"block movement\" commands.
See \\[hpb-move--forward-block-of-lines] and \\[hpb-move--backward-block-of-lines]."
	:type 'integer
	:group 'editing-basics
)

;;;###autoload
(defun hpb-move--backward-block-of-lines ()
	"Block backward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `hpb-move--block-movement-size' variable."
	(interactive)
	(line-move (- hpb-move--block-movement-size) t t t)
)

;;;###autoload
(defun hpb-move--forward-block-of-lines ()
	"Block forward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `hpb-move--block-movement-size' variable."
	(interactive)
	(line-move hpb-move--block-movement-size t t t)
)

(provide 'hpb-move)
