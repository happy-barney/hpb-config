;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-firstn)
(require 'ert)

(defun hpb-firstn-as-path (n list)
  "Returns up to 'n' elements from 'list' as path string"
  (if (and (= n 1) (string= "" (car list))) "/"
    (mapconcat
     'identity
     (hpb-firstn n list)
     "/")
    )
)

(ert-deftest hpb-firstn-as-path ()
  "Test hpb-firstn-as-path"
  (should (equal (hpb-firstn-as-path 0 '("" "a" "b" "c")) ""))
  (should (equal (hpb-firstn-as-path 1 '("" "a" "b" "c")) "/"))
  (should (equal (hpb-firstn-as-path 1 '("a" "b" "c"))    "a"))
  (should (equal (hpb-firstn-as-path 2 '("" "a" "b" "c")) "/a"))
  (should (equal (hpb-firstn-as-path 3 '("" "a" "b" "c")) "/a/b"))
  )

(provide 'hpb-firstn-as-path)
