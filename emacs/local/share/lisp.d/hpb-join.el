;; -*- Mode: Emacs-Lisp -*-

(defun hpb-join (join-char list)
  "Concat list of string with join char"
  (mapconcat 'identity list join-char))

;;(ert-deftest hpb-join ()
;;  "Test hpb-join"
;;  (should (equal (hpb-join "-" '()) ""))
;;  (should (equal (hpb-join "-" '("a")) "a"))
;;  (should (equal (hpb-join "-" '("a" "b")) "a-b"))
;;  )

(provide 'hpb-join)
