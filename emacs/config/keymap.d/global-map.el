;;; -*- Mode: Emacs-Lisp -*-

(defvar hpb/text-sort-map (hpb-define-sparse-map '(
	("l" . 'sort-lines)
	("p" . 'sort-paragraphs)
	("i" . 'hpb-text--sort-paragraph-lines)
)))

(defvar hpb/text-map (hpb-define-sparse-map '(
	("s" . hpb/text-sort-map)
)))

(define-key global-map (kbd "C-c t") hpb/text-map)

(use-package emacs
	:bind (
		("C-x C-z"      . nil) ; default: iconify-or-deiconify-frame
		("C-x <return>" . nil) ; default: prefix (choose coding system)
		("C-x m"        . nil) ; default: compose email
	)
)

(use-package emacs
	:init
		(require 'mouse-copy)

	:bind (
		;; Mouse
		("<mouse-8>"        . 'previous-buffer)
		("<mouse-9>"        . 'next-buffer)
		("<down-mouse-3>"   . 'mouse-buffer-menu)
		("C-<down-mouse-3>" . 'mouse-buffer-menu)

		;; F-keys
		("<f1>"             . 'help-command)
		("<f2>"             . 'save-buffer)
		("<f3>"             . 'find-file)
		("<f4>"             . 'revert-buffer)
		("<f5>"             . 'switch-to-buffer)
		("<f6>"             . 'other-window)
;		("<f7>"             . nil)
		("<f8>"             . 'recenter)
;		("<f11>"            . 'manual-entry)
		("<f12>"            . 'hpb-buffer--kill-current-buffer)

		("C-<f11>"          . 'execute-extended-command)
		("C-<f12>"          . 'hpb-magit--stage-buffer-file)
		("C-<f2>"           . 'copyright-update)
		("C-<f3>"           . 'find-file-at-point)
;		("C-<f4>"           . nil)
		("C-<f5>"           . 'hpb-project--switch-buffer)
		("C-<f9>"           . 'next-error)
		("C-<f10>"          . 'previous-error)

		("S-<f2>"           . 'save-some-buffers)
		("S-<f3>"           . 'find-file-at-point)
		("S-<f4>"           . 'make-frame)
		("S-<f5>"           . 'switch-to-buffer-other-frame)

		("C-S-<f12>"        . 'hpb-kill-buffer-delete-file)
	)
)

(global-set-key (kbd "C-c i (") 'hpb-text--self-insert)
(global-set-key (kbd "C-c i [") 'hpb-text--self-insert)
(global-set-key (kbd "C-c i {") 'hpb-text--self-insert)
(global-set-key (kbd "C-c i \"") 'hpb-text--self-insert)

(define-key global-map (kbd "C-x m g") 'magit-status)
(define-key global-map (kbd "C-x m g") 'magit-status)
(define-key global-map (kbd "C-x m b") 'magit-branch-popup)
(define-key global-map (kbd "C-x m y") 'magit-show-refs-popup)
(define-key global-map (kbd "C-x m z") 'magit-stash-popup)
(define-key global-map (kbd "C-x m s t") 'magit-status)
(define-key global-map (kbd "C-x m c o") 'magit-checkout)
(define-key global-map (kbd "C-x m f f") 'magit-find-file)
(define-key global-map (kbd "C-x m l l") 'magit-log-current)
(define-key global-map (kbd "C-x m . a") #'hpb-magit--stage-buffer-file)
(define-key global-map (kbd "C-x m . b") 'magit-blame)
(define-key global-map (kbd "C-x m . B") 'magit-blame-quit)
(define-key global-map (kbd "C-x m . e") 'magit-ediff-compare)
(define-key global-map (kbd "C-x m . E") 'magit-ediff-stage)
(define-key global-map (kbd "C-x m . l") 'magit-log-buffer-file)
(define-key global-map (kbd "C-x m . y") 'magit-show-refs-popup)
(define-key global-map (kbd "C-x m . z") 'magit-stash-popup)
(define-key global-map (kbd "C-;"               ) 'hpb-text--self-insert)
(define-key global-map (kbd "C-."               ) 'undo)
(define-key global-map (kbd "C-_"               ) 'undo)
(define-key global-map (kbd "<backtab>"         ) 'indent-relative)
(define-key global-map (kbd "C-<tab>"           ) 'dabbrev-expand)
(define-key global-map (kbd "C-c <tab>"         ) 'indent-to-column)
(define-key global-map (kbd "C-<backtab>"  ) 'indent-to-column)
(define-key global-map (kbd "C-c <left>"        ) 'hide-subtree)
(define-key global-map (kbd "C-c <right>"       ) 'show-subtree)
(define-key global-map (kbd "C-c <up>"          ) (lambda () (interactive) (hide-subtree) (show-children)))
(define-key global-map (kbd "C-c <down>"        ) 'show-children)
(define-key global-map (kbd "C-c C-<left>"        ) (lambda () (interactive) (hide-subtree) (outline-forward-same-level 1)))
(define-key global-map (kbd "C-c C-<right>"       ) 'show-subtree)
(define-key global-map (kbd "C-c C-<up>"          ) (lambda () (interactive) (hide-subtree) (show-children)))
(define-key global-map (kbd "C-c C-<down>"        ) 'show-children)
(define-key global-map (kbd "C-c <prior>"       ) 'outline-up-heading)
(define-key global-map (kbd "C-c C-<prior>"       ) 'outline-up-heading)
(define-key global-map (kbd "C-c <home>"         ) (lambda () (interactive) (outline-up-heading 9)))
(define-key global-map (kbd "C-c C-<home>"       ) (lambda () (interactive) (outline-up-heading 9)))
(define-key global-map (kbd "C-<up>"             ) 'hpb-move--backward-block-of-lines)
(define-key global-map (kbd "C-<down>"           ) 'hpb-move--forward-block-of-lines)
(define-key global-map (kbd "DEL"               ) 'viper-delete-char)
(define-key global-map (kbd "<insert>"          ) 'ignore)

(define-key global-map (kbd "M-S-<up>"         ) 'outline-move-subtree-up)
(define-key global-map (kbd "M-S-<down>"       ) 'outline-move-subtree-down)

(define-key global-map (kbd "M-{"               ) 'outline-backward-same-level)
(define-key global-map (kbd "M-}"               ) 'outline-forward-same-level)

(define-key global-map (kbd "C-S-<up>") 'scroll-up-line)
(define-key global-map (kbd "C-S-<down>") 'scroll-down-line)

;;; F-keys

(define-key global-map (kbd "C-c M-%"          ) 'swap-words)
(define-key global-map (kbd "C-c c"            ) 'compile)

(define-key global-map (kbd "C-x <left>"   ) 'previous-buffer)
(define-key global-map (kbd "C-x C-<left>" ) 'previous-buffer)
(define-key global-map (kbd "C-x <right>"  ) 'next-buffer)
(define-key global-map (kbd "C-x C-<right>") 'next-buffer)

(define-key global-map (kbd "C-c o f") 'ff-find-other-file)

(define-key global-map (kbd "C-L"	   ) (lambda () (interactive) (recenter 10)))

(require 'move-lines)
(define-key global-map (kbd "M-<up>"         ) 'move-lines-up)
(define-key global-map (kbd "M-<down>"       ) 'move-lines-down)

(require 'projectile)
(require 'helm-projectile)
;;;
(define-key projectile-command-map (kbd "s h") 'helm-projectile-ag)
(define-key projectile-command-map (kbd "f") nil)
(define-key projectile-command-map (kbd "f p") 'projectile-find-file)
(define-key projectile-command-map (kbd "f h") 'helm-projectile-find-file)
(define-key projectile-command-map (kbd "F") nil)
(define-key projectile-command-map (kbd "F p") 'projectile-find-file-in-known-projects)
(define-key projectile-command-map (kbd "F h") 'helm-projectile-find-file-in-known-projects)

(require 'projectile)
(define-key global-map (kbd "C-c p") 'projectile-command-map)

(require 'string-inflection)
(define-key global-map (kbd "C-c i i") 'string-inflection-all-cycle)
(define-key global-map (kbd "C-c i k") 'string-inflection-kebab-case)
(define-key global-map (kbd "C-c i u") 'string-inflection-underscore)
(define-key global-map (kbd "C-c i %") 'toggle-parens)
(define-key global-map (kbd "C-c i (") 'toggle-parens-set-parens)
(define-key global-map (kbd "C-c i )") 'toggle-parens-set-parens)
(define-key global-map (kbd "C-c i 0") 'toggle-parens-set-parens)
(define-key global-map (kbd "C-c i 9") 'toggle-parens-set-parens)

(require 'evil-numbers)
(define-key global-map (kbd "C-c n +") 'evil-numbers/inc-at-pt)
(define-key global-map (kbd "C-c n -") 'evil-numbers/dec-at-pt)
(define-key global-map (kbd "C-c n a") 'evil-numbers/inc-at-pt)
(define-key global-map (kbd "C-c n z") 'evil-numbers/dec-at-pt)
(define-key global-map (kbd "C-c n i") 'evil-numbers/inc-at-pt)
(define-key global-map (kbd "C-c n d") 'evil-numbers/dec-at-pt)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
