;;; -*- Mode: Emacs-Lisp -*-

(require 'cperl-mode)
(require 'hpb-join)
(require 'hpb-local)
;(require 'hpb-perl-templates)

;;; Registry cperl-mode as default perl-mode

;;; Custom variables
(custom-set-variables
	'(cperl-comment-column 41)
	'(cperl-indent-level 4)
	`(cperl-continued-statement-offset 4)
	'(cperl-indent-parens-as-block t)
	'(cperl-indent-wrt-brace nil)
)

;;; TODO
;; (defcustom hpb-perl-cpan-authority)
;; (defcustom hpb-perl-cpan-name)

;;;###autoload
(defun hpb-perl-insignificant-pod ()
  (and
   (eq major-mode 'cperl-mode)
   (get-char-property (point) 'in-pod)
   (not (eq ?= (char-after (point))))
   )
)

;;;###autoload
(defun hpb-perl-advice-outline-next-heading (orig-fun &rest args)
  (interactive)

  (apply orig-fun args) ;(outline-next-heading)

  (while (hpb-perl-insignificant-pod)
	(apply orig-fun args) ;(outline-next-heading)
	)
  )

;;;###autoload
(defun hpb-perl-advice-outline-previous-heading (orig-fun &rest args)
  (interactive)

  (apply orig-fun args) ;(outline-next-heading)

  (while (hpb-perl-insignificant-pod)
	(apply orig-fun args) ;(outline-next-heading)
	)
  )

(advice-add 'outline-next-heading :around #'hpb-perl-advice-outline-next-heading)
(advice-add 'outline-previous-heading :around #'hpb-perl-advice-outline-previous-heading)

;; *******************************************************************
;;;###autoload
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
