;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--destructive "hpb-transient--destructive" nil t)
(transient-define-prefix hpb-transient--destructive ()
	"Transient menu with destructive actions."
	[
		[
			"Kill"
			("k"   "kill buffer"          hpb-buffer--kill-current-buffer)
			("d"   "kill file & buffer"   hpb-buffer--kill-delete-file    :if (lambda () buffer-file-name))
			("f"   "kill frame"           delete-frame)
		]
		[
			"Git"
			("u"   "unstage file"         hpb-magit--unstage-buffer-file  :if hpb-buffer--is-magit-project)
			("U"   "untrack file"         hpb-magit--untrack-buffer-file  :if hpb-magit--is-tracked-buffer-file)
		]
	]
)

(provide 'hpb-transient--destructive)
