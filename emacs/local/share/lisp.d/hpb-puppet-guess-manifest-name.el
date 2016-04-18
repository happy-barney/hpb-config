;; -*- Mode: Emacs-Lisp -*-

(defun hpb-puppet-guess-manifest-name ()
  "Guess puppet manifest name of buffer's file name"
  (let* ((case-fold-search nil)
         (file (buffer-file-name (current-buffer)))
         (without-suffix    (replace-regexp-in-string "\\.pp\$" "" file))
         (without-modules   (replace-regexp-in-string ".*\\/modules\\/" "" without-suffix))
         (without-manifests (replace-regexp-in-string ".*\\manifests\\/\\(init\\)?" "" without-modules))
         (manifest-name     (replace-regexp-in-string "\\/" "::" without-manifests))
        )
    manifest-name
  ))

(provide 'hpb-puppet-guess-manifest-name)
