;;; -*- Mode: Emacs-Lisp -*-

(defun hpb-hook-enable-index ()
  "wrapper to enable \"best possible\" menu index"

  (imenu-add-menubar-index)             ; GNU Emacs
)

(provide 'hpb-hook-enable-index)
