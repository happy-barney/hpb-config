;;; -*- Mode: Emacs-Lisp -*-

; idea origin: https://emacs.stackexchange.com/a/37697

;;;###autoload
(defun hpb-parens--set (&optional char)
	"Set parens at cursor to specified CHAR pair.

If CHAR is not provided, use base-char logic from last-command-event.
CHAR can be either start or end character of a pair from insert-pair-alist.
Consults insert-pair-alist to determine the appropriate start and end characters."
	(interactive)
	(let* (
		(target-char (or char (event-basic-type last-command-event)))
		(pair-entry (or
			(assq target-char insert-pair-alist)
			(rassq target-char insert-pair-alist)
		))
		(start-char (if pair-entry
						(if (eq (car pair-entry) target-char)
                            target-char
                            (cdr pair-entry))
                        target-char))
         (end-char (if pair-entry
                      (if (eq (car pair-entry) target-char)
                          (cdr pair-entry)
                          target-char)
                      target-char))
         (parens (funcall show-paren-data-function))
         (paren-start (if (and parens (< (nth 0 parens) (nth 2 parens)))
                         (nth 0 parens) (nth 2 parens)))
         (paren-end (if (and parens (< (nth 0 parens) (nth 2 parens)))
                       (nth 2 parens) (nth 0 parens))))
    (when parens
      (goto-char paren-start)
      (delete-char 1)
      (insert (char-to-string start-char))
      (goto-char paren-end)
      (delete-char 1)
      (insert (char-to-string end-char)))))
