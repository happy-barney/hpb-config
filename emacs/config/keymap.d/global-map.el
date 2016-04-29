;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-magit-stage-current-buffer)

(define-key global-map (kbd "C-x C-z"      ) nil) ; default: iconify-or-deiconify-frame
(define-key global-map (kbd "C-x <return>" ) nil) ; default: prefix (choose coding system)
(define-key global-map (kbd "C-x m"        ) nil) ; default: compose email

(define-key global-map (kbd "C-<down-mouse-3>") 'mouse-buffer-menu)

(define-key global-map (kbd "C-x m g") 'magit-status)
(define-key global-map (kbd "C-x m y") 'magit-show-refs-popup)
(define-key global-map (kbd "C-x m s t") 'magit-status)
(define-key global-map (kbd "C-x m c o") 'magit-checkout)
(define-key global-map (kbd "C-x m f f") 'magit-find-file)
(define-key global-map (kbd "C-x m l l") 'magit-log-current)
(define-key global-map (kbd "C-x m . a") 'hpb-magit-stage-current-buffer)
(define-key global-map (kbd "C-x m . b") 'magit-blame)
(define-key global-map (kbd "C-x m . B") 'magit-blame-quit)
(define-key global-map (kbd "C-x m . e") 'magit-ediff-compare)
(define-key global-map (kbd "C-x m . E") 'magit-ediff-stage)
(define-key global-map (kbd "C-x m . l") 'magit-log-buffer-file)
(define-key global-map (kbd "C-x m . y") 'magit-show-refs-popup)

(define-key global-map (kbd "C-<f11>"              ) 'execute-extended-command)
(define-key global-map (kbd "C-;"               ) (lambda () (interactive) (insert ";")))
(define-key global-map (kbd "C-."               ) 'undo)
(define-key global-map (kbd "<backtab>"         ) 'indent-relative)
(define-key global-map (kbd "C-<tab>"           ) 'dabbrev-expand)
(define-key global-map (kbd "C-c <tab>"         ) 'indent-to-column)
(define-key global-map (kbd "C-<backtab>"  ) 'indent-to-column)
(define-key global-map (kbd "C-c <left>"        ) 'hide-subtree)
(define-key global-map (kbd "C-c <right>"       ) 'show-subtree)
(define-key global-map (kbd "C-c <up>"          ) (lambda () (interactive) (hide-subtree) (show-children)))
(define-key global-map (kbd "C-c <down>"        ) 'show-children)
(define-key global-map (kbd "DEL"               ) 'viper-delete-char)
(define-key global-map (kbd "<insert>"          ) 'ignore)

(define-key global-map (kbd   "<f1>"           ) 'help-command)
(define-key global-map (kbd   "<f2>"           ) 'save-buffer)
(define-key global-map (kbd "S-<f2>"           ) 'save-some-buffers)
(define-key global-map (kbd "C-<f2>"           ) 'write-buffer)
(define-key global-map (kbd   "<f3>"           ) 'find-file)
(define-key global-map (kbd "S-<f3>"           ) 'find-file-at-point)
(define-key global-map (kbd "C-<f3>"           ) 'find-file-at-point)
(define-key global-map (kbd   "<f4>"           ) 'revert-buffer)
(define-key global-map (kbd "S-<f4>"           ) 'make-frame)
(define-key global-map (kbd "C-<f4>"           ) 'delete-frame)
(define-key global-map (kbd   "<f5>"           ) 'switch-to-buffer)
(define-key global-map (kbd "S-<f5>"           ) 'switch-to-buffer-other-frame)
(define-key global-map (kbd   "<f6>"           ) 'other-window)
(define-key global-map (kbd   "<f7>"           ) nil)
(define-key global-map (kbd   "<f8>"           ) 'recenter)
(define-key global-map (kbd   "<f9>"           ) 'next-error)
(define-key global-map (kbd   "<f10>"          ) 'previous-error)
(define-key global-map (kbd   "<f11>"          ) 'manual-entry)
(define-key global-map (kbd   "<f12>"          ) 'kill-this-buffer)
(define-key global-map (kbd "C-S-<f12>"        ) 'hpb-kill-buffer-delete-file)

(define-key global-map (kbd "C-c M-%"          ) 'swap-words)
(define-key global-map (kbd "C-c c"            ) 'compile)

(define-key global-map (kbd "C-x <left>"   ) 'previous-buffer)
(define-key global-map (kbd "C-x C-<left>" ) 'previous-buffer)
(define-key global-map (kbd "C-x <right>"  ) 'next-buffer)
(define-key global-map (kbd "C-x C-<right>") 'next-buffer)

(define-key global-map (kbd "C-c o f") 'ff-find-other-file)
(define-key global-map (kbd "<down-mouse-3>"         ) 'mouse-buffer-menu)

(define-key global-map (kbd "C-L"	   ) (lambda () (interactive) (recenter 10)))

(require 'move-lines)
(define-key global-map (kbd "M-<up>"         ) 'move-lines-up)
(define-key global-map (kbd "M-<down>"       ) 'move-lines-down)

(require 'projectile)
(require 'helm-projectile)
;;;
(define-key viper-vi-basic-map (kbd "C-u") 'universal-argument)
(define-key projectile-command-map (kbd "s h") 'helm-projectile-ag)
(define-key projectile-command-map (kbd "f") nil)
(define-key projectile-command-map (kbd "f p") 'projectile-find-file)
(define-key projectile-command-map (kbd "f h") 'helm-projectile-find-file)
(define-key projectile-command-map (kbd "F") nil)
(define-key projectile-command-map (kbd "F p") 'projectile-find-file-in-known-projects)
(define-key projectile-command-map (kbd "F h") 'helm-projectile-find-file-in-known-projects)

(require 'whitespace)
(define-key global-map (kbd "C-x ~ SPC") 'whitespace-mode)

(require 'puppet)
(define-key puppet-mode-map (kbd "C-c + i p") (lambda () (interactive) (insert (hpb-puppet-guess-manifest-name))))
