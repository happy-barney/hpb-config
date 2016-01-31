;;; -*- Mode: Emacs-Lisp -*-

(require 'org)

(custom-set-variables
 '(org-clock-persist 'history)
 )

(org-clock-persistence-insinuate)
