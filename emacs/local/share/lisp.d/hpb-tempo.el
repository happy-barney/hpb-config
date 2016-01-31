;;; -*- Mode: Emacs-Lisp -*-

(require 'tempo)
(setq tempo-interactive t)

(defvar tempo-initial-pos nil
  "Initial position in template after expansion")

(defadvice tempo-insert (around tempo-insert-pos-2 act)
  "Extends tempo-insert with new tokens.
~ ... Define initial position.
current-year ... insert current-year
my-email ....... value of \\[hpb-email]
"
  (cond
   ((eq element '~)             (setq tempo-initial-pos (point-marker)))
   ((eq element 'current-year)  (insert (format-time-string "%Y")))
   ((eq element 'my-email)      (if hpb-email (insert hpb-email)))
   (t ad-do-it)
   ))

(defadvice tempo-insert-template (around tempo-insert-template-pos act)
  "Set initial position when defined. ChristophConrad"
  (setq tempo-initial-pos nil)
  ad-do-it
  (if tempo-initial-pos
      (progn
        (put template 'no-self-insert t)
        (goto-char tempo-initial-pos))
    (put template 'no-self-insert nil)))

(provide 'hpb-tempo)
