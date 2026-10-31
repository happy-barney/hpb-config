;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--write "hpb-transient--write" nil t)
(transient-define-prefix hpb-transient--write ()
	"Transient menu with write operations."
	[
		[
			"Save"
			("s"   "save (& stage)"       hpb-buffer--save        :if hpb-buffer--is-magit-project)
			("S"   "save"                 save-buffer)
			("a"   "save all buffers"     save-some-buffers)
			("p"   "save project buffers" projectile-save-project-buffers)
		]
		[
			"Write"
			("w"   "write file"           write-file)
			("W"   "write file (& stage)" hpb-buffer--write       :if hpb-buffer--is-magit-project)
			("g"   "write region"         write-region            :if use-region-p)
			("G"   "write region (& stage)" hpb-region--write     :if (lambda () (and (use-region-p) (hpb-buffer--is-magit-project)))
			)
		]
		[
			"Rename"
			("r"   "rename visited file"  rename-visited-file)
			("R"   "rename (git)"         magit-file-rename       :if hpb-buffer--is-magit-project)
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
		]
		[
			"Variants"
			("b"   "save with backup"     (lambda () (interactive) (save-buffer 16)))
			("n"   "save without backup"  (lambda () (interactive) (save-buffer 0)))
		]
	]
)

(provide 'hpb-transient--write)
