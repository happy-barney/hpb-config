;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--shebang ()
	"Return interpreter from shebang line of the current buffer, nil when there is none."
	(save-excursion
		(save-restriction
			(widen)
			(goto-char (point-min))
			(when (looking-at "#![ \t]*\\(.+\\)$")
				(string-trim (match-string-no-properties 1))
			)
		)
	)
)

(provide 'hpb-buffer--shebang)
