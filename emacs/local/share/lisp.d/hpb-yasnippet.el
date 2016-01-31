;;; -*- Mode: Emacs-Lisp -*

(require 'yasnippet)

(defun hpb-yas-insert-snippet-key (key)
  (yas-expand-snippet
   (yas--template-content (cdr (car
                                (mapcan #'(lambda (table) (yas--fetch table key))
                                        (yas--get-snippet-tables))
                                )))
))

(provide 'hpb-yasnippet)
