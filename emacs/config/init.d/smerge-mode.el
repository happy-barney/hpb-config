;;; -*- Mode: Emacs-Lisp -*-

(require 'smerge-mode)
(require 'hpb-smerge-extend)

(define-key smerge-basic-map (kbd "s") 'smerge-swap)
(define-key smerge-basic-map (kbd "x") 'hpb-smerge-extend)

(define-key smerge-mode-map (kbd "C-c +") 'hpb-smerge-extend)
(define-key smerge-mode-map (kbd "C-c !") 'smerge-swap)

(define-key smerge-mode-map (kbd "<f5>") 'hpb-smerge-extend)
(define-key smerge-mode-map (kbd "<f6>") 'smerge-swap)

(define-key smerge-mode-map (kbd "<f7>") 'smerge-prev)
(define-key smerge-mode-map (kbd "<f8>") 'smerge-next)

(define-key smerge-mode-map (kbd "<f9>") 'smerge-keep-upper)
(define-key smerge-mode-map (kbd "<f10>") 'smerge-keep-lower)
(define-key smerge-mode-map (kbd "<f11>") 'smerge-keep-all)
