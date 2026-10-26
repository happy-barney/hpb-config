;;; -*- Mode: Emacs-Lisp -*-

;;;###autoload
(defun hpb-emacs--configure-default-frame ()
	"Set background color and size of the default frame.
The size depends on the width of the display in pixels (1680, 1920 or 3840),
other displays keep the default size."
	(add-to-list 'default-frame-alist '(background-color . "#c0c0c0"))
	(cond
		((= (display-pixel-width) 1680)
			(add-to-list 'default-frame-alist '(width  . 89))
			(add-to-list 'default-frame-alist '(height . 41))
		)
		((= (display-pixel-width) 1920)
			(add-to-list 'default-frame-alist '(width  . 103))
			(add-to-list 'default-frame-alist '(height . 42))
		)
		((= (display-pixel-width) 3840)
			(add-to-list 'default-frame-alist '(width  . 113))
			(add-to-list 'default-frame-alist '(height . 55))
		)
	)
)

(provide 'hpb-emacs--configure-default-frame)
