;;; -*- Mode: Emacs-Lisp -*-

(require 'smerge-mode)

(define-key smerge-mode-map (kbd "<f7>") 'smerge-prev)
(define-key smerge-mode-map (kbd "<f8>") 'smerge-next)

(define-key smerge-mode-map (kbd "<f9>") 'smerge-keep-upper)
(define-key smerge-mode-map (kbd "<f10>") 'smerge-keep-lower)
(define-key smerge-mode-map (kbd "<f11>") 'smerge-keep-all)
