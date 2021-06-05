
(require 'ansi-color)

(defun hpb/ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'hpb/ansi-colorize-buffer)
