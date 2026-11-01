;;; -*- Mode: Emacs-Lisp; lexical-binding: t -*-

(require 'transient)

(defvar hpb-transient--context-favourite-modes
	'(
		("W" . whitespace-mode)
		("Y" . yas-minor-mode)
		("E" . editorconfig-mode)
	)
	"Favourite minor modes shown in `hpb-transient--context', list of (KEY . MODE).")

(defvar hpb-transient--context-mode-keys
	"abcdefghijklmnopqrstuvwxyz0123456789"
	"Keys assigned to active minor modes in `hpb-transient--context'.")

(defun hpb-transient--context-mode-description (mode)
	"Return description of minor MODE showing its state."
	(format "[%s] %s" (if (and (boundp mode) (symbol-value mode)) "x" " ") mode)
)

(defun hpb-transient--context-mode-suffixes (modes)
	"Return transient suffixes toggling MODES, list of (KEY . MODE)."
	(transient-parse-suffixes 'hpb-transient--context
		(mapcar
			(lambda (entry)
				(let ((mode (cdr entry)))
					(list (car entry)
						(lambda () (interactive) (funcall mode 'toggle))
						:description (lambda () (hpb-transient--context-mode-description mode))
						:if (lambda () (fboundp mode))
						:transient t
					)
				)
			)
			modes
		)
	)
)

;;;###autoload (autoload 'hpb-transient--context "hpb-transient--context" nil t)
(transient-define-prefix hpb-transient--context ()
	"Transient menu with context management (minor modes)."
	[
		[
			"Active"
			:class transient-column
			:setup-children
				(lambda (_)
					(hpb-transient--context-mode-suffixes
						(seq-mapn #'cons
							(mapcar #'char-to-string hpb-transient--context-mode-keys)
							(hpb-buffer--minor-modes)
						)
					)
				)
		]
		[
			"Favourite"
			:class transient-column
			:setup-children
				(lambda (_)
					(hpb-transient--context-mode-suffixes hpb-transient--context-favourite-modes)
				)
		]
		[
			"Context"
			("X"   "turn off context"     hpb-context--disable            :transient t)
			("T"   indent-tabs-mode
				:description (lambda () (hpb-transient--context-mode-description 'indent-tabs-mode))
				:transient t
			)
		]
	]
)

(provide 'hpb-transient--context)
