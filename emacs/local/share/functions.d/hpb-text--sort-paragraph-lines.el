;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-text--sort-paragraph-lines ()
  (interactive)

  (let ((orig-line (- (line-number-at-pos (point) t) 1))
		(orig-col  (current-column)))
	(save-excursion
	  (let ((beg (progn (backward-paragraph) (forward-line) (point)))
			(end (progn (forward-paragraph) (point)))
			)
		(sort-lines nil beg end)))
	(goto-char 0)
	(forward-line orig-line)
	(if (< (+ orig-col (point)) (line-end-position))
		(forward-char orig-col)
	  (goto-char (line-end-position)))
	))

(provide 'hpb-text--sort-paragraph-lines)
