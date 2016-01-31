;;; -*- Mode: Emacs-Lisp -*-
;;; C mode customization
(require 'cc-mode)
(require 'outline)
(require 'hpb-local)
(require 'hpb-join)

;;; Variables
(defconst hpb-c-mode-outline-regexp
  (concat
                                        ; Beginning line
   "^"
   (hpb-join "\\|"
             '(
                                        ; identifier or directive
               "\\(#?[a-zA-Z_]\\)"
                                        ; comment start but not doxygen continuation comment
               "\\(/\\)[*/][^!*/]"
               "\\(/\\)[*/][!*/][^<]"
               )
             )
   )
  "Customized outline regexp"
  )

;;; Functions
(defun hpb-c-mode-outline-level ()
  "Calculate outline level"
  (interactive)
  (cond ((looking-at "[a-zA-Z_]") 1)
        ((looking-at "#[^ ]"   ) 1)
        ((looking-at "#   define") 1)
        ((looking-at "/\\*\\*$") 1)
        ((looking-at "\\(/\\)[*/][^!*/]") 2)
        ((looking-at "\\(/\\)[*/][!*/][^<]") 2)
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

  (hpb-local-load-config "c-mode")
  )

;;; Provide
(provide 'hpb-c-mode)
