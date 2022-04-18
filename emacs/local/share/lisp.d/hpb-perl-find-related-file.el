;; -*- Mode: Emacs-Lisp -*-

(require 'ert)
(require 's)

;(defun hpb-perl-find-related-file/guess-path (path)
;  (cond
;   ((hpb-perl-find-related-file/veure-looks-like-test-class path)
;	(hpb-perl-find-related-file/veure-make-play-file
;	 (projectile-project-root)
;	 (string-match-p "/t/TestFor\\(/.*\\\\.pm)")
;	 )
;	(concat (projectile-project-root) "lib" (
;(defun hpb-perl-find-related-file/looks-like-veure-test-class

(defun hpb-perl-guess-test-or-implementation-path (path force-dash)
  (cond
   ((hpb-perl-looks-like-test-file-p path) (hpb-perl-make-play-file-path path))
   ((hpb-perl-looks-like-play-file-p path) (hpb-perl-make-test-file-path path force-dash))
   (t nil)
  ))


(defun hpb-perl-looks-like-test-file-p (path)
  "predicate: does it looks like test file?"
  (cond
   ((string-match-p "/t/lib/"                    path) nil)
   ((string-match-p "/t/tests/TestsFor/.*\\.pm$" path) t)
   ((string-match-p "/t/.*\\.t$"                 path) t)
   (t nil)
  ))

(defun hpb-perl-looks-like-play-file-p (path)
  (cond
   ((not (string-match-p "\\.pm$" path)) nil)
   ((string-match-p "/t/" path) nil)
   ((not (string-match-p "/lib/" path)) nil)
   (t t)
   ))

(defun hpb-perl-make-test-file-path (path &optional force-dash)
  (hpb-perl-make-test-file-path/aaw path)
    )

(defun hpb-perl-make-test-file-path/aaw (path &optional force-dash)
  (let* ((parts (s-split "/lib/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         (path-with-ext (replace-regexp-in-string "\\.pm$" ".t" last-part))
         (path-with-dash (replace-regexp-in-string "/" "-" path-with-ext))
         (prefix (concat (s-join "/lib/" (butlast parts)) "/t/tests/TestsFor/"))
         (full-path-without-ext (concat prefix last-part))
         (full-path-with-ext (concat prefix path-with-ext))
         (full-path-with-dash (concat prefix path-with-dash))
         )
    (cond
     ((file-exists-p full-path-without-ext) full-path-without-ext)
     ((file-exists-p full-path-with-ext) full-path-with-ext)
     (t full-path-with-dash)
     )
    ))

(defun hpb-perl-make-test-file-path/gdc (path &optional force-dash)
  (let* ((parts (s-split "/lib/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         (path-with-ext (replace-regexp-in-string "\\.pm$" ".t" last-part))
         (path-with-dash (replace-regexp-in-string "/" "-" path-with-ext))
         (prefix (concat (s-join "/lib/" (butlast parts)) "/t/tests/TestsFor/"))
         (full-path-without-ext (concat prefix last-part))
         (full-path-with-ext (concat prefix path-with-ext))
         (full-path-with-dash (concat prefix path-with-dash))
         )
    (cond
     (force-dash full-path-with-dash)
     ((file-exists-p full-path-without-ext) full-path-without-ext)
     ((file-exists-p full-path-with-ext) full-path-with-ext)
     (t full-path-with-dash)
     )
    ))

(defun hpb-perl-make-play-file-path (path)
  (hpb-perl-make-play-file-path/aaw path)
    )

(defun hpb-perl-make-play-file-path/aaw (path)
  (let* ((parts (s-split "/t/tests/TestsFor/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         )
    (concat (s-join "/lib/" (append (butlast parts) (list last-part))))
    ))

(defun hpb-perl-make-play-file-path/gdc (path)
  (let* ((parts (s-split "/t/" path))
         (last-part (nth (+ -1 (safe-length parts)) parts))
         (path-with-ext (replace-regexp-in-string "\\.t$" ".pm" last-part))
         (path-with-slash (replace-regexp-in-string "-" "/" path-with-ext))
         )
    (concat (s-join "/lib/" (append (butlast parts) (list path-with-slash))))
    ))

(defun hpb-perl-find-related-file (&optional force-dash)
  (interactive "P")
  (let* ((file-path (buffer-file-name))
        (other-path (hpb-perl-guess-test-or-implementation-path file-path force-dash)))
    (if other-path (find-file other-path))
))

(provide 'hpb-perl-find-related-file)
