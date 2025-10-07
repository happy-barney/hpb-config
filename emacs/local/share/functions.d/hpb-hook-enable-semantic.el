;;; -*- Mode: Emacs-Lisp -*-

(require 'semantic)

;;;###autoload
(defun hpb-hook-enable-semantic ()
  "Wrapper to enable semantic mode (or similar)"

  (semantic-mode t)
)

(provide 'hpb-hook-enable-semantic)
