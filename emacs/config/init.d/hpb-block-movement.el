;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-block-movement)

(define-key global-map (kbd "C-<up>") 'hpb-backward-block-of-lines)
(define-key global-map (kbd "C-<down>") 'hpb-forward-block-of-lines)

