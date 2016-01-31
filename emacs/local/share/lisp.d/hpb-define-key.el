;;; -*- Mode: Emacs-Lisp -*-

(defun hpb-define-key (key-map bindings)
  "Define bindings in key-map. Bindins is list of (kbd param . symbol).
Symbol is eval-ed, so has to be quoted"

  (mapcar (lambda (def) (define-key key-map (kbd (car def)) (eval (cdr def)))) bindings)
  )

(defun hpb-define-sparse-map (&optional bindings)
  "Define bindings in key-map. Bindins is list of (kbd param . symbol).
Symbol is eval-ed, so has to be quoted"

  (let ( (key-map (make-sparse-keymap)) )
    (mapcar (lambda (def) (define-key key-map (kbd (car def)) (eval (cdr def)))) bindings)
    key-map
    )
)

;;; and provide itself
(provide 'hpb-define-key)

