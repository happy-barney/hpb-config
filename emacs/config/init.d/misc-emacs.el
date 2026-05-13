;; -*- Mode: Emacs-Lisp -*-

;;; Asorted configuration

(mouse-wheel-mode t)

(load-library "outline")
(load-library "complete")
;(dynamic-completion-mode)

(require 'dired)
(setq c-recognize-knr-p nil)

(server-start)
