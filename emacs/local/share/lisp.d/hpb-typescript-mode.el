;;; -*- Mode: Emacs-Lisp -*-

(require 'typescript-mode)
(require 'hpb-join)
(require 'hpb-local)

;;; Custom variables
(custom-set-variables
 '(typescript-indent-level 2)
 )

(defconst hpb-typescript-outline-regexp
  (concat
   "^"                                  ; Start of line
   "\\([ 	]*\\)"                  ; Skip leading whitespace - capture group \1
   "\\("                                ; begin capture group \2
   "[a-zA-Z_]+\\|[\\[\\}\\);]"
   "\\)"                                ; end capture group \2
   ))

;;; Functions
(defun hpb-typescript-outline-level ()
  (let ((face        (get-char-property (point) 'face))
        )
	(cond
	 ;; skip multiline comments
	 ((string= face "font-lock-comment-face") 999)
	 ;; skip multiline strings
	 ((string= face "font-lock-string-face") 999)
	 (t
	  (looking-at outline-regexp)
	  (let* ((match (match-string 2))
			 (indent (match-string 1))
			 (indent-level (* 2 (string-width indent)))
			 )
		(cond
		 ((string= match "}") (+ indent-level 1))
		 ((string= match ")") (+ indent-level 1))
		 ((string= match "]") (+ indent-level 1))
		 ((string= match ";") (+ indent-level 1))
		 (match               indent-level)
		 (t 999)
		 )))
   )))

(defun hpb-hook-typescript-mode ()
  (interactive)

  (outline-minor-mode t)

  (setq-local outline-regexp        hpb-typescript-outline-regexp)
  (setq-local outline-level        'hpb-typescript-outline-level)
  (setq-local indent-tabs-mode      nil)
)

;; *******************************************************************
(provide 'hpb-typescript-mode)
