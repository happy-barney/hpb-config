;;; -*- Mode: Emacs-Lisp -*-

(setq warning-minimum-level :emergency)

;;; Path to my lisp repository
(add-to-list 'load-path "~/.local/share/emacs/advice.d/")
(add-to-list 'load-path "~/.local/share/emacs/lisp.d/")
(add-to-list 'load-path "~/.local/share/emacs/functions.d/")
(add-to-list 'load-path "~/.local/share/emacs-local/advice.d/")
(add-to-list 'load-path "~/.local/share/emacs-local/lisp.d/")
(add-to-list 'load-path "~/.local/share/emacs-local/functions.d/")

(load "~/.local/share/emacs/functions.d/functions-autoload.el" t)

;;; Set important variables
(set-variable 'custom-file          "~/.config/emacs/custom.el")
(set-variable 'user-emacs-directory "~/.cache/emacs/")
(set-variable 'package-user-dir     "~/.cache/emacs/elpa")

;;; Load custom file first (allow setup to force customizable variables)
(load custom-file)

;;; Initialize packages
(require 'package)
(add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;;; Package pre-loaded for usage by init files
(require 'use-package)

(hpb-emacs--load-directory "~/.config/emacs/init.d/")
(hpb-emacs--load-directory "~/.config/emacs/keymap.d/")
(hpb-emacs--load-directory "~/.local/share/emacs/advice.d/")
(hpb-emacs--load-directory "~/.config/emacs-local/init.d/")
(hpb-emacs--load-directory "~/.config/emacs-local/keymap.d/")
(hpb-emacs--load-directory "~/.local/share/emacs-local/advice.d/")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(desktop-read)
