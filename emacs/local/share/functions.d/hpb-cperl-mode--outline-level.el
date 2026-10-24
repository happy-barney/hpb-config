;;; -*- Mode: Emacs-Lisp -*-

(defconst hpb-cperl-mode--outline-level--pod-levels
	'(
		("=pod"   . 0)
		("=head1" . 1)
		("=head2" . 2)
		("=head3" . 3)
		("=over"  . 4)
		("=back"  . 4)
		("=item"  . 5)
	)
	"Outline level of pod directives, see `hpb-cperl-mode--outline-level'."
)

;;;###autoload
(defun hpb-cperl-mode--outline-level ()
	"Return the outline level of the heading at point for `cperl-mode'.
Pod directives have fixed levels (see
`hpb-cperl-mode--outline-level--pod-levels'), code lines get a level
derived from their indentation (closing brackets and `;' one deeper).
Here-docs, multiline strings and pod text get level 999, which hides
them from the outline.  Expects `outline-regexp' to be the result of
`hpb-cperl-mode--outline-regex' (group 1 indentation, group 2 heading)."
	(let (
		(syntax-type (get-char-property (point) 'syntax-type))
		(in-pod      (get-char-property (point) 'in-pod))
		(face        (get-char-property (point) 'face))
	)
		(cond
			((memq syntax-type '(here-doc here-doc-delim string)) 999)
			((memq 'font-lock-string-face (ensure-list face)) 999)
			((and (or in-pod (eq syntax-type 'pod)) (not (eq ?= (char-after (point))))) 999)
			((not (looking-at outline-regexp)) 999)
			(t
				(let* (
					(heading      (match-string 2))
					(indent-level (* 2 (string-width (match-string 1))))
				)
					(cond
						((cdr (assoc heading hpb-cperl-mode--outline-level--pod-levels)))
						(in-pod 999)
						((member heading '("}" ")" "]" ";")) (1+ indent-level))
						(t indent-level)
					)
				)
			)
		)
	)
)

(provide 'hpb-cperl-mode--outline-level)
