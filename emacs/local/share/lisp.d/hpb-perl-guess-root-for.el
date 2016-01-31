;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-firstn-as-path)

(defun hpb-perl-guess-root-for (arg-token arg-lookup-path)
  "Guess root dir for file using lookup path"
  (let* (
        (token       (car (split-string arg-token "/")))
        (lookup-path (split-string (directory-file-name (file-name-directory arg-lookup-path)) "/"))
        (search-token (member token lookup-path))
        )
    (if search-token (hpb-firstn-as-path(- (length lookup-path) (length search-token)) lookup-path)
      (let ((search-lib (member "lib" lookup-path)))
        (if search-lib (hpb-firstn-as-path(- (length lookup-path) (length search-lib)) lookup-path))
        ))
    ))

(provide 'hpb-perl-guess-root-for)
