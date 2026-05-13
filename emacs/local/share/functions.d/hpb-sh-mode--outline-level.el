
;;;###autoload
(defun hpb-sh-mode--outline-level ()
	(looking-at outline-regexp)
	(let* (
		(match        (match-string 2))
		(indent       (match-string 1))
		(indent-level (* 2 (string-width indent)))
        )
		(cond
			((string= match "}") (+ 1 indent-level))
			(match               indent-level)
			(t 999)
		)
	)
)
