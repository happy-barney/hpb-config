;;; -*- Mode: Emacs-Lisp -*-

(require 'cperl-mode)
(require 'hpb-join)
(require 'hpb-local)
(require 'hpb-perl-templates)

;;; Registry cperl-mode as default perl-mode
(fset 'perl-mode 'cperl-mode)

;;; Custom variables
(custom-set-variables
 '(cperl-comment-column 41)
 '(cperl-indent-level 4)
 )

;;; TODO
;; (defcustom hpb-perl-cpan-authority)
;; (defcustom hpb-perl-cpan-name)

;;; Variables
(defconst hpb-perl-outline-pod-list
  '(
    "=head1\\b"
    "=head2\\b"
    "=head3\\b"
    "=item\\b"
    "=over\\b"
    "=back\\b"
	"=pod\\b"
    ))

(defconst hpb-perl-outline-regexp
  (concat
   "^"                                  ; Start of line
   "\\([ 	]*\\)"                  ; Skip leading whitespace - capture group \1
   "\\("                                ; begin capture group \2
   (hpb-join "\\|"
             (append
               hpb-perl-outline-pod-list
               '("[a-zA-Z_]" "[\"'\\$;\\[\\}\\)]" "=>" "1")
               )
             )
   "\\)"                                ; end capture group \2
   ))

(defun hpb-perl-insignificant-pod ()
  (and
   (eq major-mode 'cperl-mode)
   (get-char-property (point) 'in-pod)
   (not (eq ?= (char-after (point))))
   )
)

(defun hpb-perl-advice-outline-next-heading (orig-fun &rest args)
  (interactive)

  (apply orig-fun args) ;(outline-next-heading)

  (while (hpb-perl-insignificant-pod)
	(apply orig-fun args) ;(outline-next-heading)
	)
  )

(defun hpb-perl-advice-outline-previous-heading (orig-fun &rest args)
  (interactive)

  (apply orig-fun args) ;(outline-next-heading)

  (while (hpb-perl-insignificant-pod)
	(apply orig-fun args) ;(outline-next-heading)
	)
  )

(advice-add 'outline-next-heading :around #'hpb-perl-advice-outline-next-heading)
(advice-add 'outline-previous-heading :around #'hpb-perl-advice-outline-previous-heading)

;;; Functions

(defun hpb-hook-cperl-mode ()
  (interactive)

  (outline-minor-mode t)

  (setq outline-regexp        hpb-perl-outline-regexp)
  (setq outline-level        'hpb-perl--outline-level)

  (hpb-local-load-config "cperl-mode")
)

;; *******************************************************************
(defun hpb-perl-detect-version-number ()
  (interactive)

  (save-excursion
    (goto-char (point-min))
    (cond
     ((re-search-forward "package [\\w:]+ v\\([0-9]+\\(\\.[0-9]+\\)*\\);") (match-string 1))
     ((re-search-forward "\\$VERSION[ ]*=[ ]*v\\([0-9]+\\(\\.[0-9]+\\)*\\)") (match-string 1))
     )
    )
)

;; *******************************************************************
(provide 'hpb-perl-mode)
