;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-perl--guess-package-name ()
	"Guess Perl package name from the file name of current buffer.
Returns nil when the buffer does not visit a file.  The extension is
removed and `/' is replaced by `::' in the part of the path which is
selected by the first rule which applies:
 - the part after the last `/lib/' (so `lib/perl5/Foo.pm' is `perl5::Foo')
 - the part after the project root (see `hpb-project--project-root')
 - the part after the last directory which does not start with an
   upper case letter"
	(when-let ((file (buffer-file-name)))
		(let* (
			(case-fold-search nil)
			(name (file-name-sans-extension file))
			(root (when-let ((dir (hpb-project--project-root)))
				(file-name-as-directory (expand-file-name dir))
			))
		)
			(string-replace "/" "::"
				(cond
					((string-match (rx bos (* nonl) "/lib/" (group (* nonl)) eos) name)
						(match-string 1 name)
					)
					((and root (string-prefix-p root name))
						(substring name (length root))
					)
					(t
						(replace-regexp-in-string
							(rx bos (* nonl) "/" (not (any "A-Z" "/")) (* (not (any "/"))) "/")
							""
							name
						)
					)
				)
			)
		)
	)
)

(provide 'hpb-perl--guess-package-name)
