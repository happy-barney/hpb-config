;;; -*- Mode: Emacs-Lisp -*-

(require 'yasnippet)

(add-to-list 'yas-snippet-dirs "~/.local/share/emacs/yasnippet")

(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") nil)
(define-key yas-minor-mode-map (kbd "C-c SPC") 'yas-expand)

