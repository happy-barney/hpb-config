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
    "=head1"
    "=head2"
    "=head3"
    "=item"
    "=over"
    ))

(defconst hpb-perl-outline-regexp
  (concat
   "^"                                  ; Start of line
   "\\([ 	]*\\)"                  ; Skip leading whitespace - capture group \1
   "\\("                                ; begin capture group \2
   (hpb-join "\\|"
             (append
               hpb-perl-outline-pod-list
               '("[a-z_]+" "1")
               )
             )
   "\\)"                                ; end capture group \2
   "\\b"                                ; Word boundary
   ))

;;; Functions
(defun hpb-perl-outline-level ()
  (let ((syntax-type (get-char-property (point) 'syntax-type))
        (face        (get-char-property (point) 'face))
        )
    (cond
     ;; skip HERE-DOCS
     ((string= syntax-type "here-doc") 999)
     ((string= syntax-type "here-doc-delim") 999)
     ;; skip multiline strings
     ((string= syntax-type "string") 999)
     ((string= face "font-lock-string-face") 999)
     ((and (eq syntax-type 'pod) (not (eq ?= (char-after (point)))) 999))
     (t
      (looking-at outline-regexp)
      (let ( (match (match-string 2))
             (indent (match-string 1))
             )
        (cond
         (match (string-width indent))
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
