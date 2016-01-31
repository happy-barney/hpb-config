;;; -*- Mode: Emacs-Lisp -*-

;; hpb-local
;; *******************************************************************
;; Set of buffer local utilities

(require 'hpb-load)

(defun hpb-local-load-config (mode)
  "Load buffer local configuration for mode.
Searches files:
 - ~/.config/emacs/local.d/'mode'.el
 - ~/.config/emacs-local/local.d/'mode'.el
"
  (hpb-load-if-exists (concat "~/.config/emacs/local.d/" mode "-local.el"))
  (hpb-load-if-exists (concat "~/.config/emacs-local/local.d/" mode "-local.el"))
  )

(provide 'hpb-local)
