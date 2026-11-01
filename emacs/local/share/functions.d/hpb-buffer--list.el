;;; -*- Mode: Emacs-Lisp -*-

(require 'cl-lib)

;;;###autoload
(cl-defun hpb-buffer--list (&key other-window name mode project filters groups noselect shrink)
	"Open buffer menu (see `ibuffer').

Keyword arguments:
  :other-window  non-nil to display buffer menu in other window
  :name          buffer menu name, default is derived from :mode and :project
  :mode          list only buffers in given major mode
  :project       list only buffers of project with given root
  :filters       additional filters (see `ibuffer-filtering-alist')
  :groups        filter groups (see `ibuffer-filter-groups')
  :noselect      non-nil to not select buffer menu window
  :shrink        non-nil to shrink buffer menu window to fit"
	(interactive)

	(let*
		(
			(project-name (and project (projectile-project-name project)))
			(name (or name
				(and (or mode project)
					(format "*%s Buffers*"
						(string-join (delq nil (list project-name (and mode (symbol-name mode)))) " ")
					)
				)
			))
		)

		(ibuffer other-window name
			(append
				(and mode (list (cons 'used-mode mode)))
				(and project (list (cons 'projectile-files project)))
				filters
			)
			noselect shrink groups
		)
	)
)

(provide 'hpb-buffer--list)
