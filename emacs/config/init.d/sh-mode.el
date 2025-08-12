
(require 'sh-script)
(require 'hl-line)

(defun hpb-sh-mode-outline-level ()
  (looking-at outline-regexp)
  (let* ( (match (match-string 2))
		  (indent (match-string 1))
		  (indent-level (* 2 (string-width indent)))
          )
	(cond
	 ((string= match "}") (+ 1 indent-level))
	 (match indent-level)
	 (t 999)
	 )))

(defconst hpb-sh-mode-outline-regex
  (concat
   "^"                                  ; Start of line
   "\\([ 	]*\\)"                  ; Skip leading whitespace - capture group \1
   "\\([^ 	\n#]\\)"                  ; following character
  ))

(defun hpb-sh-mode-outline-hook ()
  (setq outline-level 'hpb-sh-mode-outline-level)
  (setq outline-regexp hpb-sh-mode-outline-regex)
  )

(add-hook 'sh-mode-hook 'hl-line-mode)
(add-hook 'sh-mode-hook 'hpb-sh-mode-outline-hook)
