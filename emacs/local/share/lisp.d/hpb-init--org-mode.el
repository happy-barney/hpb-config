;;; -*- Mode: Emacs-Lisp -*-

(use-package org
	:ensure nil

	:hook (
		(org-mode . hpb-hook--disable-indent-tabs-mode)
	)
)

(provide 'hpb-init--org-mode)
