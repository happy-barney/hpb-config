;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--read "hpb-transient--read" nil t)
(transient-define-prefix hpb-transient--read ()
	"Transient menu with read operations."
	[
		[
			"File"
			("f"   "find file"            find-file)
			("."   "file at point"        find-file-at-point)
			("o"   "other window"         find-file-other-window)
			("v"   "read-only"            find-file-read-only)
		]
		[
			"Project"
			("p"   "find project file"    helm-projectile-find-file       :if hpb-project--project-root)
			("P"   "find in known projects" helm-projectile-find-file-in-known-projects)
		]
		[
			"Directory"
			("d"   "dired"                dired)
			("j"   "dired (current file)" dired-jump)
			("D"   "project root"         projectile-dired                :if hpb-project--project-root)
		]
		[
			"Recent"
			("r"   "recent files"         helm-recentf)
			("R"   "recent project files" helm-projectile-recentf         :if hpb-project--project-root)
		]
	]
)

(provide 'hpb-transient--read)
