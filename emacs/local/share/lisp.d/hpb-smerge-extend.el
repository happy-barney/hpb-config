
(require 'smerge-mode)

(defun hpb-smerge-extend-orig ()
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

(defun hpb-smerge-extend (otherpos)
  (interactive
   (list (if (use-region-p) (mark-marker)
           (prefix-numeric-value current-prefix-arg))))
  ;; FIXME: If OTHERPOS is inside (or next to) another conflict
  ;; or if there are conflicts between the current conflict and OTHERPOS,
  ;; we end up messing up the conflict markers.  We should merge the
  ;; conflicts instead!
  (condition-case err
      (smerge-match-conflict)
    (error (if (not (markerp otherpos)) (signal (car err) (cdr err))
             (goto-char (prog1 otherpos (setq otherpos (point-marker))))
             (smerge-match-conflict))))
  (let ((beg (match-beginning 0))
        (end (copy-marker (match-end 0)))
        text)
    (when (integerp otherpos)
      (goto-char (if (>= otherpos 0) end beg))
      (setq otherpos (copy-marker (line-beginning-position (+ otherpos 1)))))
    (setq text (cond
                ((<= end otherpos)
                 (buffer-substring end otherpos))
                ((<= otherpos beg)
                 (buffer-substring otherpos beg))
                (t (user-error "The other end should be outside the conflict"))))
    (dotimes (i 3)
      (let* ((mn (- 3 i))
             (me (funcall (if (<= end otherpos) #'match-end #'match-beginning)
                          mn)))
       (when me
        (goto-char me)
        (insert text))))
    (delete-region (if (<= end otherpos) end beg) otherpos)))

(provide 'hpb-smerge-extend)
