;;; -*- Mode: Emacs-Lisp -*-

(require 'transient)

;;;###autoload (autoload 'hpb-transient--previous "hpb-transient--previous" nil t)
(transient-define-prefix hpb-transient--previous ()
	"Transient menu with navigation to previous item."
	[
		"Previous"
		("c"   "context"              hpb-context--previous                             :transient t)
		("C"   "first context"        (lambda () (interactive) (hpb-context--previous t)) :transient t)
		("e"   "error"                previous-error                                    :transient t)
		("w"   "window"               (lambda () (interactive) (other-window -1))       :transient t)
		("f"   "frame"                (lambda () (interactive) (other-frame -1))        :transient t)
		("p"   "paragraph"            backward-paragraph                                :transient t)
		("d"   "function"             beginning-of-defun                                :transient t)
		("b"   "bookmark"             hpb-bookmark--previous                            :transient t)
		("B"   "buffer"               previous-buffer                                   :transient t)
	]
)

(provide 'hpb-transient--previous)
