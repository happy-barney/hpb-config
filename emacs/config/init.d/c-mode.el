;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-c-mode)
(require 'hpb-hook-newline-and-indent)
(require 'hpb-hook-enable-semantic)
(require 'hpb-hook-enable-index)

;;; Registry mode
(add-to-list 'auto-mode-alist '("\\.C\$"   . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\$"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh\$"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\$"   . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\$"   . c-mode))
(add-to-list 'auto-mode-alist '("\\.xs\$"  . c-mode))

;;; Mode specific customization
(custom-set-variables
 '(c-auto-align-backslashes t)
 '(c-backslash-column 72)
 '(c-basic-offset     4)
 '(c-offsets-alist
   '((arglist-cont-nonempty . +)
     (substatement-open     . 0)
     (arglist-intro         . +)
     (arglist-close         . 0)
     (case-label            . +)
     ))
)

;;; Registry hooks
;; *******************************************************************

;; c-mode hooks:
;; - c-mode-common-hook ... applies on every sub-mode
;; - c-mode-hook
;; - c++-mode-hook
;; - objc-mode-hook
;; - java-mode-hook
;; - idl-mode-hook
;; - pike-mode-hook
;; - awk-mode-hook

(add-hook 'c-mode-common-hook 'hpb-hook-newline-and-indent)
(add-hook 'c-mode-common-hook 'hpb-hook-c-mode-common)

(add-hook 'c-mode-hook        'hpb-hook-c-mode)
(add-hook 'c-mode-hook        'hpb-hook-enable-semantic)
(add-hook 'c-mode-hook        'hpb-hook-enable-index)

