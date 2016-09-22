;; -*- Mode: Emacs-Lisp -*-

(require 'ert)
(require 's)

(defun hpb-perl-guess-test-or-implementation-path (path)
  (cond
   ((hpb-perl-looks-like-test-file-p path) (hpb-perl-make-play-file-path path))
   ((hpb-perl-looks-like-play-file-p path) (hpb-perl-make-test-file-path path))
   (t nil)
  ))


(defun hpb-perl-looks-like-test-file-p (path)
  "predicate: does it looks like test file?"
  (string-match-p "/t/.*\.t$" path)
  )

(defun hpb-perl-looks-like-play-file-p (path)
  (cond
   ((not (string-match-p "\.pm$" path)) nil)
   ((string-match-p "/t/" path) nil)
   ((not (string-match-p "/lib/" path)) nil)
   (t t)
   ))

(defun hpb-perl-make-test-file-path (path)
  (let* ((parts (s-split "/lib/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         (path-with-ext (replace-regexp-in-string "\\.pm$" ".t" last-part))
         (path-with-dash (replace-regexp-in-string "/" "-" path-with-ext))
         )
    (concat (s-join "/lib/" (butlast parts)) "/t/" path-with-dash)
    ))

(defun hpb-perl-make-play-file-path (path)
  (let* ((parts (s-split "/t/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         (path-with-ext (replace-regexp-in-string "\\.t$" ".pm" last-part))
         (path-with-slash (replace-regexp-in-string "-" "/" path-with-ext))
         )
    (concat (s-join "/lib/" (append (butlast parts) (list path-with-slash))))
    ))

(defun hpb-perl-find-related-file (&optional path)
  (interactive)
  (let* ((file-path (if path path (buffer-file-name)))
        (other-path (hpb-perl-guess-test-or-implementation-path file-path)))
    (if other-path (find-file other-path))
))

(provide 'hpb-perl-find-related-file)
