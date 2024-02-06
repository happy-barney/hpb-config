;;; -*- Mode: Emacs-Lisp -*-

(add-to-list 'default-frame-alist '(background-color . "#c0c0c0"))

(cond
 ((and (= (display-pixel-width) 1920) (= (display-pixel-height) 1200))
  (add-to-list 'default-frame-alist '(width  . 92))
  (add-to-list 'default-frame-alist '(height . 55)))

 ((= (display-pixel-width) 1920)
  (add-to-list 'default-frame-alist '(width  . 92))
  (add-to-list 'default-frame-alist '(height . 41)))

 ((= (display-pixel-width) 1680)
  (add-to-list 'default-frame-alist '(width  . 89))
  (add-to-list 'default-frame-alist '(height . 41)))
)
