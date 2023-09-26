
(require 'sh-script)
(require 'hl-line)

(defun hpb-sh-outline-level ()
  (or
   ;; Commented outline heading
   (and (string-match (rx
		       (* space)
		       (one-or-more (syntax comment-start))
		       (one-or-more space)
		       (group (one-or-more "\*"))
		       (one-or-more space))
		      (match-string 0))
	(- (match-end 1) (match-beginning 1) 1))

   ;; Keyword/function heading
   ;; Add 8 (the highest standard outline level) to every keyword
   ;; heading
   (+ 8 (- (match-end 3) (match-beginning 3)))))

(defun hpb-sh-mode-outline-hook ()
  (setq outline-level 'hpb-sh-outline-level)
  (setq outline-regexp
	(rx
	 (group
	  (or
	   ;; Outline headings
	   (and (* space)
		(one-or-more (syntax comment-start))
		(* space)
		(group (one-or-more "\*"))
		(* space))

	   ;; Keywords and functions
	   (and (group (* space))
		(or
		 ;; e.g. "function foo"
		 (and (or "function" "if" "elif" "else" "for" "while")
		      (one-or-more space))

		 ;; e.g. "foo()"
		 (and (one-or-more (or alnum "_-"))
		      (* space)
		      (syntax open-parenthesis)
		      (syntax close-parenthesis)))))))))

(add-hook 'sh-mode-hook 'hl-line-mode)
(add-hook 'sh-mode-hook 'hpb-sh-mode-outline-hook)
