;; -*- Mode: Emacs-Lisp -*-

(require 'subr-x)

(use-package s
	:ensure t
	:pin melpa-stable
)

;;;###autoload
(defun hpb-perl--guess-package-name ()
	"Guess Perl package name from buffer's file name"

	(thread-last
		(buffer-file-name)
		(file-name-sans-extension)
		(s-replace-regexp (rx (seq string-start (* any) "/lib/")) "")
		(s-replace "/" "::")
	)
)

(provide 'hpb-perl--guess-package-name)
