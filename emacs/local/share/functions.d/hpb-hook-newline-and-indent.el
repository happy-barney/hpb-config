;;; -*- Mode: Emacs-Lisp -*-

(defun hpb-hook-newline-and-indent ()
  "Map locally <return> key to `newline-and-indent'"

  (local-set-key (kbd "<return>") 'newline-and-indent)
)

(provide 'hpb-hook-newline-and-indent)

