;;; -*- Mode: Emacs-Lisp -*-

;; hpb-local
;; *******************************************************************
;; Set of buffer local utilities

(defun hpb-local-load-config (mode)
  "Load buffer local configuration for mode.
Searches files:
 - ~/.config/emacs/local.d/'mode'.el
 - ~/.config/emacs-local/local.d/'mode'.el
"
  (load (concat "~/.config/emacs/local.d/" mode "-local.el") t)
  (load (concat "~/.config/emacs-local/local.d/" mode "-local.el") t)
  )

(provide 'hpb-local)
