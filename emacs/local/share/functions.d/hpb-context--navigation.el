;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb-context--navigation-alist
	'(
		((lambda () (bound-and-true-p smerge-mode))
			smerge-prev                         smerge-next)
		((lambda () (derived-mode-p 'diff-mode))
			diff-hunk-prev                      diff-hunk-next)
		((lambda () (derived-mode-p 'magit-section-mode))
			magit-section-backward              magit-section-forward)
		((lambda () (derived-mode-p 'compilation-mode))
			compilation-previous-error          compilation-next-error)
		((lambda () (derived-mode-p 'occur-mode))
			occur-prev                          occur-next)
		((lambda () (derived-mode-p 'xref--xref-buffer-mode))
			xref-prev-line-no-show              xref-next-line-no-show)
		((lambda () (or (derived-mode-p 'outline-mode) (bound-and-true-p outline-minor-mode)))
			outline-previous-visible-heading    outline-next-visible-heading)
		((lambda () t)
			beginning-of-defun                  hpb-context--next-defun)
	)
	"Context navigation, list of (PREDICATE PREVIOUS NEXT).
First entry with PREDICATE returning non-nil in the current buffer provides
PREVIOUS and NEXT commands (see `hpb-context--previous', `hpb-context--next').")

;;;###autoload
(defun hpb-context--navigation ()
	"Return (PREVIOUS NEXT) commands for the current buffer (see `hpb-context--navigation-alist')."
	(cdr (seq-find (lambda (entry) (funcall (car entry))) hpb-context--navigation-alist))
)

;;;###autoload
(defun hpb-context--next-defun ()
	"Move to the beginning of the next function (see `beginning-of-defun')."
	(interactive)

	(beginning-of-defun -1)
)

(provide 'hpb-context--navigation)
