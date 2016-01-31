;; -*- Mode: Emacs-Lisp -*-

(defun hpb-load-directory (&rest dirs)
  "Load all .el or .elc files from dir.
Directory may not exists and may not be expanded.
Files are not loaded recursively."

  (mapcar (lambda (dir)
            (if (file-exists-p dir)
                (let ((files (directory-files dir t "\\.elc?$")))
                  (mapcar (lambda (file)
                            (condition-case error-var
                                (load-file file)
                              (error (message "Problem in loading %s: %s" file error-var))
                              ))
                          files
                          )))
            )
          dirs
          )
  t
)

(provide 'hpb-load-directory)

