;;; -*- Mode: Emacs-Lisp -*-

(use-package evil-numbers
	:ensure t
	:pin melpa-stable

	:bind (
		("C-c n +" . #'evil-numbers/inc-at-pt)
		("C-c n -" . #'evil-numbers/dec-at-pt)
		("C-c n a" . #'evil-numbers/inc-at-pt)
		("C-c n z" . #'evil-numbers/dec-at-pt)
		("C-c n i" . #'evil-numbers/inc-at-pt)
		("C-c n d" . #'evil-numbers/dec-at-pt)
	)
)
