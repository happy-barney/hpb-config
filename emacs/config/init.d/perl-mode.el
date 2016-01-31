;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-perl-mode)
(require 'hpb-perl-templates)
(require 'hpb-define-key)
(require 'hpb-hook-newline-and-indent)
(require 'hpb-hook-enable-index)

;;; auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.pl\$"    . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm\$"    . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\$"     . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.psgi\$"  . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.fcgi\$"  . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.cgi\$"   . cperl-mode))

;;; Code generation bindings
(setq hpb-perl-insert-map
      (hpb-define-sparse-map
       '(
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
      )

(require 'hpb-perl-find-other-file)
(hpb-define-key cperl-mode-map
                '(
                  ("C-c ?" . 'cperl-find-bad-style)
                  ("C-c c" . 'cperl-check-syntax)
                  (":"     . nil)
                  ("C-c +" . hpb-perl-insert-map)
                  ("C-}"   . (lambda () (interactive) (insert "}")))
                  ("C-;"   . (lambda () (interactive) (insert ";")))
		  ("C-c o f" . 'hpb-perl-find-other-file)
                  ))

;;; Hooks
(add-hook 'cperl-mode-hook 'hpb-hook-newline-and-indent)
(add-hook 'cperl-mode-hook 'hpb-hook-enable-index)
(add-hook 'cperl-mode-hook 'hpb-hook-cperl-mode)

