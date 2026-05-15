;;; -*- Mode: Emacs-Lisp -*-
;;; Idea taken from XEmacs simple.el

(defcustom hpb-move--block-movement-size 6
  "*Number of lines that \"block movement\" commands (\\[hpb-move--forward-block-of-lines], \\[hpb-move--backward-block-of-lines]) move by."
  :type 'integer
  :group 'editing-basics)

;;;###autoload
(defun hpb-move--backward-block-of-lines ()
  "Block backward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `hpb-move--block-movement-size' variable."
  (interactive)
  (previous-line hpb-move--block-movement-size t))

;;;###autoload
(defun hpb-move--forward-block-of-lines ()
  "Block forward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `hpb-move--block-movement-size' variable."
  (interactive)
  (next-line hpb-move--block-movement-size t))

(provide 'hpb-move)

