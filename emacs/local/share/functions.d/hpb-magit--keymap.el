;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-magit--keymap
	(hpb-keymap--sparse-map '(
		("."            . (hpb-keymap--require 'hpb-magit--keymap-file))
		("b"            . #'magit-branch)
		("c o"          . #'magit-checkout)
		("C-<return>"   . #'magit-visit-ref)
		("f f"          . #'magit-find-file)
		("g"            . #'magit-status)
		("l l"          . #'magit-log-current)
		("r c"          . #'magit-reflog-current)
		("s t"          . #'magit-status)
		("y"            . #'magit-show-refs)
		("z"            . #'magit-stash)
	))
	"Keymap with magit commands (bound to prefix in `global-map')."
)

(provide 'hpb-magit--keymap)
