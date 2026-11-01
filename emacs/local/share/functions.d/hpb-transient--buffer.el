;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--buffer "hpb-transient--buffer" nil t)
(transient-define-prefix hpb-transient--buffer ()
	"Transient menu with buffer selection operations."
	[
		[
			"Switch"
			("b"   "switch to buffer"     switch-to-buffer)
			("p"   "project buffer"       projectile-switch-to-buffer     :if hpb-project--project-root)
			("o"   "other window"         switch-to-buffer-other-window)
			("s"   "scratch"              scratch-buffer)
			("m"   "messages"             (lambda () (interactive) (switch-to-buffer (messages-buffer))))
		]
		[
			"List"
			("l"   "buffer list"          ibuffer)
			("L"   "project buffer list"  projectile-ibuffer              :if hpb-project--project-root)
			("M"   hpb-buffer--list-by-mode
				:description (lambda () (format "%s buffers" major-mode))
			)
			("P"   hpb-project--list-by-mode
				:description (lambda () (format "project %s buffers" major-mode))
				:if hpb-project--project-root
			)
		]
		[
			"Frame"
			("f"   "switch buffer other frame" switch-to-buffer-other-frame)
			("F"   "make frame"           make-frame)
		]
		[
			"Buffer"
			("g"   "revert buffer"        hpb-buffer--revert)
		]
	]
)

(provide 'hpb-transient--buffer)
