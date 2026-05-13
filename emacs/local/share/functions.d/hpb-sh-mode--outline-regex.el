
;;;###autoload
(defun hpb-sh-mode--outline-regex ()
	(rx
		bol
		(group (* (any " \t")))        ; indentation
		(group (not (any " \t\n#")))   ; next significant character
	)
)
