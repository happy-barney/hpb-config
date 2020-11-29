;;; -*- Mode: Emacs-Lisp -*-

(define-generic-mode 'hpb-bnf-generic-mode
  '("#") ;; comment char: inapplicable because # must be at start of line
  nil ;; keywords
  '(
    ("#.*" . 'font-lock-comment-face) ;; comments
    ("^«[-:_[:digit:][:alpha:]]+»" . 'font-lock-function-name-face) ;; define rule
    ("^<[-:_[:digit:][:alpha:]]+>" . 'font-lock-function-name-face) ;;
    ("^[-:_[:digit:][:alpha:]]+"   . 'font-lock-function-name-face) ;;
    ("\\<qr/\\([^\\\n/]\\|\\(\\\\.\\)\\)*/[ixm]*"   . 'font-lock-builtin-face)       ;; regular expression
    ("«[-:_[:digit:][:alpha:]]+»" . 'font-lock-keyword-face)        ;; define rule
    ("<[-:_[:digit:][:alpha:]]+>" . 'font-lock-keyword-face)        ;; define rule
    ("\\([-_[:digit:][:alpha:]]\\|\\(::\\)\\)+"   . 'font-lock-keyword-face)        ;; define rule
    ("::=" . 'font-lock-const-face)          ;; operators
    (":=" . 'font-lock-const-face)          ;; operators
    ("=" . 'font-lock-const-face)          ;; operators
    ;("\\(['\"]\\)\\([^\\\\]\\|\\(\\\\.\\)\\)*?\\1" . 'font-lock-string-face )
    ("|\\|/"      . 'font-lock-warning-face) ;; or operator
   )
 '("\\.bnf\\'") ;; filename suffixes
 nil ;; extra function hooks
 "Major mode for BNF highlighting.")
