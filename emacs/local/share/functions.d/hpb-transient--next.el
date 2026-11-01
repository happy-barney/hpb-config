;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--next "hpb-transient--next" nil t)
(transient-define-prefix hpb-transient--next ()
	"Transient menu with navigation to next item."
	[
		"Next"
		("c"   "context"              hpb-context--next                                 :transient t)
		("C"   "last context"         (lambda () (interactive) (hpb-context--next t))   :transient t)
		("e"   "error"                next-error                                        :transient t)
		("w"   "window"               other-window                                      :transient t)
		("f"   "frame"                other-frame                                       :transient t)
		("p"   "paragraph"            forward-paragraph                                 :transient t)
		("d"   "function"             hpb-context--next-defun                           :transient t)
		("b"   "bookmark"             hpb-bookmark--next                                :transient t)
		("B"   "buffer"               next-buffer                                       :transient t)
	]
)

(provide 'hpb-transient--next)
