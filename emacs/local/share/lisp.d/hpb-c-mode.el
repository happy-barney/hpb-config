;;; -*- Mode: Emacs-Lisp -*-
;;; C mode customization
(require 'cc-mode)
(require 'outline)
(require 'hpb-local)
(require 'hpb-join)

;;; Variables
(defconst hpb-c-mode-outline-regexp
   "^[ \t]*[#a-zA-Z0-9./]"
   "Customized outline regexp"
  )

(defun hpb-c-mode-debug-current-outline-level ()
  (interactive)

  (message (concat
			"Level: "
			(number-to-string (hpb-c-mode-outline-level))
			"; [1] " (match-string 1)
			"; [2] " (match-string 2)
			"; [3] " (match-string 3)
			)
		   ))

;;; Functions
(defun hpb-c-mode-outline-level ()
  "Calculate outline level"
  (interactive)
  (looking-at "^\\([ \t]*\\)\\([^a-zA-Z0-9/.#]\\)?\\(.\\)?" )
  (cond ((match-string 2) 999)
		((match-string 3) (string-width (match-string 1)))
        (t 999)
        ))

(defun hpb-hook-c-mode-common ()
  "Common customizations"
  (interactive)

  (outline-minor-mode t)
  (hpb-local-load-config "c-mode-common")
  )

(defun hpb-hook-c-mode ()
  "C-mode customizations"
  (interactive)

  (setq outline-regexp  hpb-c-mode-outline-regexp)
  (setq outline-level  'hpb-c-mode-outline-level)

  (c-toggle-electric-state -1)
  (hpb-local-load-config "c-mode")
  )

;;; Provide
(provide 'hpb-c-mode)
