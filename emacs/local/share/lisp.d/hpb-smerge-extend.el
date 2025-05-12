
(require 'smerge-mode)

(defun hpb-smerge-extend ()
  "Copy the line directly following the conflict into both upper and lower sections.
This is useful when both versions need to share some common code that follows the conflict."
  (interactive)

  (smerge-match-conflict)
  (let ((beg (match-beginning 0))
        (end (match-end 0))
        (next-line ""))
    ;; Save the line following the conflict
    (save-excursion
      (goto-char end)
      (when (and (not (eobp))
                 (looking-at ".*$"))
        (setq next-line (concat (match-string 0) "\n"))
		(delete-region end (min (1+ (line-end-position)) (point-max)))
		))

    (when (not (string= next-line ""))
      (save-excursion
		(smerge-match-conflict)
        (goto-char (match-end 3))
        (insert next-line)
	  )

      (save-excursion
		(smerge-match-conflict)
        (goto-char (match-end 1))
        (insert next-line)
	  )
	  )
	))

(provide 'hpb-smerge-extend)
