;;; -*- Mode: Emacs-Lisp -*-

(add-to-list 'default-frame-alist '(background-color . "#c0c0c0"))

(cond
 ((and (= (display-pixel-width) 3840) (= (display-pixel-height) 2160))
  ; monospace 14
;  (add-to-list 'default-frame-alist '(width  . 112))
;  (add-to-list 'default-frame-alist '(height . 60)))

  ; monospace 15
  (add-to-list 'default-frame-alist '(width  . 103))
  (add-to-list 'default-frame-alist '(height . 52)))

  ; monospace 16
;  (add-to-list 'default-frame-alist '(width  . 95))
;  (add-to-list 'default-frame-alist '(height . 50)))

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
