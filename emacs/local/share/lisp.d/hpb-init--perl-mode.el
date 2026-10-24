;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-perl-find-other-file)
(require 'hpb-perl-find-related-file)
(require 'hpb-perl-mode)
(require 'hpb-perl-templates)
(require 'hpb-init--s)

;;; Code generation bindings
(defvar hpb-perl-insert-map
	(hpb-keymap--sparse-map '(
		("i p" . 'tempo-template-hpb-perl-guess-package)
		("i f" . 'tempo-template-hpb-perl-findbin)
		("i 5" . 'tempo-template-hpb-perl-feature-5)
		("i s" . 'tempo-template-hpb-perl-use-pragma)
		("i t" . 'tempo-template-hpb-perl-test-prologue)
		("d a" . 'tempo-template-hpb-perl-pod-author)
		("d d" . 'tempo-template-hpb-perl-pod-description)
		("d e" . 'tempo-template-hpb-perl-pod-see-also)
		("d m" . 'tempo-template-hpb-perl-pod-methods)
		("d n" . 'tempo-template-hpb-perl-pod-name)
		("d r" . 'tempo-template-hpb-perl-pod-repository)
		("d s" . 'tempo-template-hpb-perl-pod-synopsis)
		("d v" . 'tempo-template-hpb-perl-pod-variables)
		("d 1" . 'tempo-template-hpb-perl-pod-head1)
		("d 2" . 'tempo-template-hpb-perl-pod-head2)
		("d 3" . 'tempo-template-hpb-perl-pod-head3)
		("d >" . 'tempo-template-hpb-perl-pod-over)
		("d <" . 'tempo-template-hpb-perl-pod-back)
		("d =" . 'tempo-template-hpb-perl-pod-item)
		("d ." . 'tempo-template-hpb-perl-pod-version)
	))
	"Keymap with perl code generation commands (bound to prefix in `cperl-mode-map')."
)

(use-package cperl-mode
	:mode (
		("/cpanfile\\'" . cperl-mode)
		("\\.cgi\\'"    . cperl-mode)
		("\\.fcgi\\'"   . cperl-mode)
		("\\.pl\\'"     . cperl-mode)
		("\\.pm\\'"     . cperl-mode)
		("\\.psgi\\'"   . cperl-mode)
		("\\.t\\'"      . cperl-mode)
	)

	:bind-map (
		("C-c +"        . hpb-perl-insert-map)
	)

	:bind (
		:map            cperl-mode-map
		(":"            . nil)
		("C-;"          . #'hpb-text--self-insert)
		("C-c ?"        . #'cperl-find-bad-style)
		("C-c C-c"      . #'recompile)
		("C-c c"        . #'cperl-check-syntax)
		("C-c o f"      . #'hpb-perl-find-other-file)
		("C-c t t"      . #'hpb-perl-find-related-file)
		("C-}"          . #'hpb-text--self-insert)
	)

	:hook (
		(cperl-mode . hpb-hook-newline-and-indent)
		(cperl-mode . hpb-hook--enable-index)
		(cperl-mode . hpb-hook--configure-outline)
		(cperl-mode . hpb-hook--load-local-config)
;		(cperl-mode . hpb-perl-mode--set-compile-command)
	)

	:custom
		(cperl-auto-newline                         t)
		(cperl-auto-newline-after-colon             nil)
		(cperl-close-paren-offset                   -4)
		(cperl-comment-column                       41)
		(cperl-continued-statement-offset           4)
		(cperl-electric-lbrace-space                nil)
		(cperl-electric-parens-mark                 t)
		(cperl-extra-newline-before-brace           nil)
		(cperl-extra-newline-before-brace-multiline nil)
		(cperl-font-lock                            t)
		(cperl-indent-comment-at-column-0           nil)
		(cperl-indent-level                         4)
		(cperl-indent-parens-as-block               t)
		(cperl-indent-subs-specially                nil)
		(cperl-label-offset                         0)
		(cperl-lineup-step                          nil)
		(cperl-min-label-indent                     0)
		(cperl-pod-here-scan                        nil)
		(cperl-regexp-indent-step                   4)
		(cperl-regexp-scan                          nil)

	:custom-face
		(cperl-array-face           ((t (:foreground "MediumPurple4" :background nil))))
		(cperl-hash-face            ((t (:foreground "DarkOrchid4" :background nil :italic nil))))
		(cperl-nonoverridable-face  ((t (:foreground "dark cyan"))))
)

(provide 'hpb-init--perl-mode)
