;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-hook--configure-outline ()
	"Configure `outline-minor-mode' for the current major mode.
Looks for function `hpb-MAJOR-MODE--outline-regex' (for example
`hpb-yaml-mode--outline-regex' for `yaml-mode'), which returns
`outline-regexp'.  When it exists, set `outline-regexp' (buffer local)
and enable `outline-minor-mode'.  Function `hpb-MAJOR-MODE--outline-level'
is optional, when it exists it is used as `outline-level'.
Does nothing when the major mode has no such function."
	(let (
		(regex-function (intern-soft (format "hpb-%s--outline-regex" major-mode)))
		(level-function (intern-soft (format "hpb-%s--outline-level" major-mode)))
	)
		(when (and regex-function (fboundp regex-function))
			(setq-local outline-regexp (funcall regex-function))
			(when (and level-function (fboundp level-function))
				(setq-local outline-level level-function)
			)
			(outline-minor-mode 1)
		)
	)
)

(provide 'hpb-hook--configure-outline)
