
(require 'yaml-mode)

(add-hook 'yaml-mode-hook 'viper-change-state-to-vi)
(add-hook 'yaml-mode-hook 'yaml-mode-outline-hook)

(defun yaml-outline-level ()
  "Return the outline level based on the indentation, hardcoded at 2 spaces."
  (s-count-matches "[ ]\\{2\\}" (match-string 0)))

(defun yaml-mode-outline-hook ()
  (outline-minor-mode)
  (setq outline-regexp "^\\([ ]\\{2\\}\\)*\\([-] \\)?\\([\"][^\"]*[\"]\\|[a-zA-Z0-9_-]*\\): *\\([>|]\\|&[a-zA-Z0-9_-]*\\)?$")
  (setq outline-level 'yaml-outline-level))
