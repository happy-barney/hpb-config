;;; -*- Mode: Emacs-Lisp -*-

(defun hpb-load-if-exists (file)
  "Load file if it exists"
  (if (file-exists-p file) (load (expand-file-name file))))

(provide 'hpb-load)
