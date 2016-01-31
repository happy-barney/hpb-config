;;; -*- Mode: Emacs-Lisp -*-

(require 'desktop)

(custom-set-variables
 '(desktop-base-file-name "emacs.desktop")
 '(desktop-base-lock-name "emacs.desktop.lock")
 '(desktop-path '("~/.cache/emacs/"))
 '(desktop-auto-save-timeout 300)
 )

(desktop-save-mode t)

