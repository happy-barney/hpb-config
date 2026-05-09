;; -*- Mode: Emacs-Lisp -*-

;;; Asorted configuration

(mouse-wheel-mode t)

(load-library "outline")
(load-library "complete")
;(dynamic-completion-mode)

(setq c-recognize-knr-p nil)

(fset 'yes-or-no-p 'y-or-n-p)

(server-start)
