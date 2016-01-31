;;; -*- Mode: Emacs-Lisp -*-
;;; Enable vi emulation using viper-mode

(setq viper-mode t)
(require 'viper)

(define-key viper-vi-basic-map (kbd "DEL") 'viper-delete-char)
(define-key viper-vi-basic-map (kbd "z z") 'viper-line-to-middle)
