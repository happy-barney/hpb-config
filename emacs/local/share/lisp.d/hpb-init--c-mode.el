;;; -*- Mode: Emacs-Lisp -*-

;; c-mode hooks:
;; - c-mode-common-hook ... applies on every sub-mode (c, c++, objc, java, idl, pike, awk)
;; - c-mode-hook, c++-mode-hook, ...

(use-package cc-mode
	:ensure nil

	:mode (
		("\\.C\\'"  . c++-mode)
		("\\.cc\\'" . c++-mode)
		("\\.hh\\'" . c++-mode)
		("\\.xs\\'" . c-mode)
	)

	;; add-hook prepends: the last one runs first, the style must precede local config
	:hook (
		(c-mode-common  . hpb-hook-newline-and-indent)
		(c-mode         . hpb-hook--load-local-config)
		(c-mode         . hpb-hook--enable-index)
		(c-mode         . hpb-hook--configure-outline)
		(c-mode         . hpb-hook--c-mode)
		(c-mode         . hpb-c--style-hook)
		(c++-mode       . hpb-c--style-hook)
	)
)

(provide 'hpb-init--c-mode)
