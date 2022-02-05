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
(defun hpb-perl-outline-level ()
  (let ((syntax-type (get-char-property (point) 'syntax-type))
        (in-pod      (get-char-property (point) 'in-pod))
        (face        (get-char-property (point) 'face))
        )
    (cond
     ;; skip HERE-DOCS
     ((string= syntax-type "here-doc") 999)
     ((string= syntax-type "here-doc") 999)
     ((string= syntax-type "here-doc-delim") 999)
     ;; skip multiline strings
     ((string= syntax-type "string") 999)
     ((string= face "font-lock-string-face") 999)
     ((and (eq syntax-type 'pod) (not (eq ?= (char-after (point)))) 999))
     ((and (eq syntax-type "pod") (not (eq ?= (char-after (point)))) 999))
     ((and in-pod (not (eq ?= (char-after (point)))) 999))
     (t
      (looking-at outline-regexp)
      (let* ( (match (match-string 2))
			  (indent (match-string 1))
			  (indent-level (* 2 (string-width indent)))
             )
        (cond
		 ((string= match "=pod")   0); (string-width "\t"))
		 ((string= match "=head1") 1); (string-width "\t"))
		 ((string= match "=head2") 2); (string-width "\t\t"))
		 ((string= match "=head3") 3); (string-width "\t\t\t"))
		 ((string= match "=over")  4); (string-width "\t\t\t\t"))
		 ((string= match "=back")  4); (string-width "\t\t\t\t"))
		 ((string= match "=item")  5); (string-width "\t\t\t\t\t"))
		 (in-pod  999)
		 ((string= match "}") (+ indent-level 1))
		 ((string= match ")") (+ indent-level 1))
		 ((string= match "]") (+ indent-level 1))
		 ((string= match ";") (+ indent-level 1))
		 (match               indent-level)
         (t 999)
         )))
    )))

(defun hpb-hook-cperl-mode ()
  (interactive)

  (outline-minor-mode t)

  (setq outline-regexp        hpb-perl-outline-regexp)
  (setq outline-level        'hpb-perl-outline-level)

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
