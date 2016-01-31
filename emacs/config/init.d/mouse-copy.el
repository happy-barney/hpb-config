;;; -*- Mode: Emacs-Lisp -*-
;;; Act like XEmacs mouse - copy with select

(require 'mouse-copy)

(global-set-key (kbd "C-<down-mouse-1>") 'mouse-drag-secondary-pasting)
