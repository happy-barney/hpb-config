;; -*- Mode: Emacs-Lisp -*-

(defun hpb-perl-guess-package-name ()
  "Guess Perl package name of buffer's file name"
  (let ((case-fold-search nil)
        (file (buffer-file-name (current-buffer)))
        )
    (replace-regexp-in-string
     "\\/" "::" (replace-regexp-in-string
                 ".*\\/[^A-Z][^\\/]*\\/" ""
                 (replace-regexp-in-string ".pm\$" "" file)
                 )
     )
    )
  )

(provide 'hpb-perl-guess-package-name)
