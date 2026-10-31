;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-buffer--toggle-executable ()
	"Toggle executable bits of the file visited by the current buffer.
When the file has any executable bit set, remove all of them (like `chmod -x'),
otherwise set them as allowed by umask (like `chmod +x')."
	(interactive)

	(hpb-buffer--ensure-file-exists)

	(let ((modes (file-modes buffer-file-name)))
		(set-file-modes buffer-file-name
			(if (zerop (logand modes #o111))
				(logior modes (logand #o111 (default-file-modes)))
				(logand modes (lognot #o111))
			)
		)
		(message "%s: %s"
			(file-name-nondirectory buffer-file-name)
			(file-modes-number-to-symbolic (file-modes buffer-file-name))
		)
	)
)

(provide 'hpb-buffer--toggle-executable)
