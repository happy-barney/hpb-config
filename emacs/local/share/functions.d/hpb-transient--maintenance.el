;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--maintenance "hpb-transient--maintenance" nil t)
(transient-define-prefix hpb-transient--maintenance ()
	"Transient menu with file and buffer maintenance operations."
	[
		[
			"Revert"
			("g"   "revert buffer"        hpb-buffer--revert)
			("m"   "normal mode"          normal-mode)
			("u"   "revert to staged"     hpb-magit--revert-buffer-file   :if hpb-buffer--is-magit-project)
			("U"   "reset to HEAD"        hpb-magit--reset-buffer-file    :if hpb-buffer--is-magit-project)
		]
		[
			"Rename"
			("r"   "rename visited file"  rename-visited-file)
			("R"   "rename (git)"         magit-file-rename               :if hpb-buffer--is-magit-project)
		]
		[
			"Permissions"
			("x"   hpb-buffer--toggle-executable
				:description (lambda ()
					(if (and buffer-file-name
							(file-exists-p buffer-file-name)
							(/= 0 (logand (file-modes buffer-file-name) #o111))
						)
						"chmod -x"
						"chmod +x"
					)
				)
			)
			("M"   "chmod"                set-file-modes)
		]
	]
	[
		[
			"Encoding"
			("c"   hpb-buffer--cycle-coding-system
				:description (lambda () (format "cycle coding system (%s)" buffer-file-coding-system))
			)
			("C"   "set coding system"    set-buffer-file-coding-system)
		]
		[
			"Indentation"
			("i"   indent-tabs-mode
				:description (lambda () (format "indent tabs mode (%s)" (if indent-tabs-mode "on" "off")))
			)
			("t"   "tabify"               (lambda ()
					(interactive)
					(if (use-region-p)
						(tabify (region-beginning) (region-end))
						(tabify (point-min) (point-max))
					)
				)
			)
			("T"   "untabify"             (lambda ()
					(interactive)
					(if (use-region-p)
						(untabify (region-beginning) (region-end))
						(untabify (point-min) (point-max))
					)
				)
			)
		]
	]
)

(provide 'hpb-transient--maintenance)
