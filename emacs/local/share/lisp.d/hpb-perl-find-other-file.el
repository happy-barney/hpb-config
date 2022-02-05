;; -*- Mode: Emacs-Lisp -*-

(require 'thingatpt)
(require 'hpb-perl-guess-root-for)

(defun hpb-perl-find-other-file ()
  (interactive)

  (let* (
        (candidate (replace-regexp-in-string "::$" "" (thing-at-point 'symbol t)))
        (file (concat (replace-regexp-in-string "::" "/" candidate) ".pm"))
        (location (concat
                   (hpb-perl-guess-root-for file (buffer-file-name (current-buffer)))
                   "/"
                   file
                   ))
        )
    (find-file location)
    )
  )

(provide 'hpb-perl-find-other-file)
