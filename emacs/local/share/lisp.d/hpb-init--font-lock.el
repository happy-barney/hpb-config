;;; -*- Mode: Emacs-Lisp -*-

(use-package font-lock
	:ensure nil

	:custom-face
		(font-lock-constant-face            ((t (:foreground "dark cyan"))))
		(font-lock-function-face            ((t (:foreground "RoyalBlue4" :bold t))))
		(font-lock-keyword-face             ((t (:foreground "dark cyan"))))
		(font-lock-string-face              ((t (:foreground "dark green"))))
		;(font-lock-string-face              ((t (:foreground "indigo"))))
		(font-lock-variable-face            ((t (:foreground "MediumOrchid4"))))
)

(provide 'hpb-init--font-lock)
