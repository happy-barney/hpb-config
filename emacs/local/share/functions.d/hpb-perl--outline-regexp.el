;; -*- Mode: Emacs-Lisp -*-

(defconst hpb-perl--outline-regexp
	(rx
		bol
		(group (* (any " \t")))                 ; indentation
		(group
			(or
				(regexp "=\\w+")                ; POD headings (generic)
				(any "a-zA-Z_")                 ; identifier start
				(any "\"'\\$;[]})")             ; punctuation chars
				"=>"
				"1"
			)
		)
	)
)

;;;###autoload
(defun hpb-perl--outline-regexp ()
	hpb-perl--outline-regexp
)

(provide 'hpb-perl--outline-regexp)
