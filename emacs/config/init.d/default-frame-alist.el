;;; -*- Mode: Emacs-Lisp -*-

(add-to-list 'default-frame-alist '(background-color . "#c0c0c0"))

(cond
 ((= (display-pixel-width) 1680)
  (add-to-list 'default-frame-alist '(width  . 89))
  (add-to-list 'default-frame-alist '(height . 41)))
 ((= (display-pixel-width) 1920)
  (add-to-list 'default-frame-alist '(width  . 103))
  (add-to-list 'default-frame-alist '(height . 42)))
)
