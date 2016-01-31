;;; -*- Mode: Emacs-Lisp -*-
;;; Idea taken from XEmacs simple.el

(defcustom hpb-block-movement-size 6
  "*Number of lines that \"block movement\" commands (\\[hpb-forward-block-of-lines], \\[hpb-backward-block-of-lines]) move by."
  :type 'integer
  :group 'editing-basics)

(defun hpb-backward-block-of-lines ()
  "Block backward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `block-movement-size' variable."
  (interactive)
  (previous-line hpb-block-movement-size t))

(defun hpb-forward-block-of-lines ()
  "Block forward movement treating collapsed (outline-mode) blocks as one line.
Amount of line is controlled by `block-movement-size' variable."
  (interactive)
  (next-line hpb-block-movement-size t))

(provide 'hpb-block-movement)

