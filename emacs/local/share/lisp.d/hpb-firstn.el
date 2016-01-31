;; -*- Mode: Emacs-Lisp -*-

(defmacro hpb-firstn (n list)
  "Macro returns up to 'n' elements from list"
  `(if (> (length ,list) ,n)
       (reverse (nthcdr (- (length ,list) ,n) (reverse ,list)))
     ,list
     ))

(provide 'hpb-firstn)

