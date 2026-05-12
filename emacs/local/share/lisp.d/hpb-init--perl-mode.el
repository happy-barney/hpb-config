;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-perl-find-other-file)
(require 'hpb-perl-find-related-file)
(require 'hpb-perl-mode)
(require 'hpb-perl-templates)

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
		("\\.pl\\'"   . cperl-mode)
		("\\.pm\\'"   . cperl-mode)
		("\\.t\\'"    . cperl-mode)
		("\\.psgi\\'" . cperl-mode)
		("\\.fcgi\\'" . cperl-mode)
		("\\.cgi\\'"  . cperl-mode)
	)

	:bind (
		:map        cperl-mode-map
		("C-c ?"    . #'cperl-find-bad-style)
		("C-c c"    . #'cperl-check-syntax)
		("C-c +"    . hpb-perl-insert-map)
		(":"        . nil)
		("C-}"      . (lambda () (interactive) (insert "}")))
		("C-;"      . (lambda () (interactive) (insert ";")))
		("C-c o f"  . #'hpb-perl-find-other-file)
		("C-c t t"  . #'hpb-perl-find-related-file)
		("C-c C-c"  . #'recompile)
	)

	:hook (
		(cperl-mode . hpb-hook-newline-and-indent)
		(cperl-mode . hpb-hook-enable-index)
		(cperl-mode . hpb-hook--cperl-mode)
;		(cperl-mode . hpb-perl-mode--set-compile-command)
	)
)

(provide 'hpb-init--perl-mode)
