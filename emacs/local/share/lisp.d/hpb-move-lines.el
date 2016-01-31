;; Taken from: http://www.emacswiki.org/emacs/MoveLine

(defun hpb-move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun hpb-move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(provide 'hpb-move-lines)
