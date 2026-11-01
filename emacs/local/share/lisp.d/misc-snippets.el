
;; http://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs/37456354#37456354
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (hpb-buffer--ensure-file-exists))
        (basename (file-name-nondirectory filename))
        (new-name (read-file-name "New name: " (file-name-directory filename) basename nil basename)))
    (if (get-buffer new-name)
        (error "A buffer named '%s' already exists!" new-name)
      (rename-file filename new-name 1)
      (rename-buffer new-name)
      (set-visited-file-name new-name)
      (set-buffer-modified-p nil)
      (message "File '%s' successfully renamed to '%s'"
               name (file-name-nondirectory new-name)))))
