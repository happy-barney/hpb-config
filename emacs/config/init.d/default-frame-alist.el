;;; -*- Mode: Emacs-Lisp -*-

(add-to-list 'default-frame-alist '(background-color . "#c0c0c0"))

;(cond
; ((= (display-pixel-width) 1680)
;  (add-to-list 'default-frame-alist '(width  . 89))
;  (add-to-list 'default-frame-alist '(height . 41)))
; ((= (display-pixel-width) 1920)
;  (add-to-list 'default-frame-alist '(width  . 103))
;  (add-to-list 'default-frame-alist '(height . 42)))
;)

  (add-to-list 'default-frame-alist '(width  . 132))
  (add-to-list 'default-frame-alist '(height . 72))

(defun set-default-frame-size ()
	(interactive)

(let ((w (alist-get 'width default-frame-alist))
      (h (alist-get 'height default-frame-alist)))
  (set-frame-size (selected-frame) w h))
)

(set-default-frame-size)
